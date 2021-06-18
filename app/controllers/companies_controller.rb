class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :set_company_without_includes, only: [:edit_employee, :move_employee]
  before_action :who_can_edit!, only: [:edit, :destroy, :update, :delete_image_attachment]
  before_action :index, only: [:advanced] #reuse the index on /companies_advanced

  # NOTE:
  # Every logged in user can create/submit a new company, and edit their own company.
  # Region champions can edit all companies in their region.
  # Admins can edit everything

  def who_can_edit!
    if current_user && (
        current_user.is_champion_in_regions(@company&.region_ids) ||
        current_user.is_employee_in_company(@company.id) ||
        current_user.is_admin?
    )
    else
      flash[:error] = 'Only admins and champions can edit'
      redirect_to @company
    end
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_back(fallback_location: companies_url)
  end

  def toggle_favorite
    @company = Company.friendly.find(params[:id])

    # Toggle if found, else create a new record
    fav = current_user
      .favorite_companies
      .unscoped
      .find_by(company: @company)

    if fav.present?
      fav.toggle!(:is_favorite)
    else
      current_user.favorite_companies.create!(company: @company, is_favorite: true)
    end

    respond_to do |format|
      format.html { redirect_to @company }
      format.js { }
    end
  end

  # GET /companies
  # GET /companies.json
  def index
    @q = Company
      .includes(
        :regions,
        :industry_taxonomies,
        :manufacturer_taxonomies,
        :manufacturers,
        :company_organization,
        :industries
      )
      .region_public_or_empty
      .where(is_verified: true)
      .where.not(soft_delete: true)
      .ransack(params[:q])

    @companies = @q.result(distinct: true).page(params[:page])
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @nearby = Company
      .geocoded
      .includes(
        :company_organization,
        :regions,
        :industries,
        :manufacturers,
        :manufacturer_taxonomies,
        #industries: [:industry_taxonomy]
      )
      .joins(:industry_taxonomies)
      .where(industry_taxonomies: {id: @company.industry_taxonomy_ids})
      .where.not(id: @company.id)
      .limit(4)
      .near(@company.to_coordinates, 50)
      .uniq

  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created. It needs to be verified by an administrator, before it will be visible on the website.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to edit_company_url(@company), notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_employee
    # TODO: Who can edit?
    if current_user.is_admin? #or manager? #or region champion?
      Employee
        .where(company: @company, user: @usr)
        .first
        .update!(role: params[:role], title: params[:title])

      render json: 'Employee changed'
    else
      # Only admin can edit?
      render json: 'Only admin can change'
    end
  end

  def move_employee
    Employee
      .where(company: @company, user: @usr)
      .first
      .insert_at(params[:position].to_i)

    render json: 'Order changed'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    # NOTE: now we also show is_verified:false companies. Should we hide them?
    # Champions (not admins) need to see them, in order to VERIFY them.
    # .where(is_verified: true)
    @company = Company
      .includes(
        company_processes: [:process_taxonomy],
        #finished_products: [:finished_products_taxonomy],
        material_tags: [:material],
        #industries: [:industry_taxonomy],
        employees: [:user],
        machines: [:machines_taxonomy]
      )
      .friendly.find(params[:id])
  end

  def set_company_without_includes
    @company = Company.find(params[:id])
    @usr = User.find(params[:user])
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(
      :m_id,
      :name, :address,
      :background,
      :description, :intro, :contact_name, :contact_email,
      :country_code,
      :contact_phone, :contact_jobtitle, :flickr, :facebook, :instagram,
      :large_run, :lat, :lng, :linkedin, :location,
      :medium_run, :minimum_order, :number_of_staff, :file_types,
      :image_bucket, :photo1, :photo2, :photo3, :photo4, :photo5, :photo6, :photo7, :photo8, :photo9, :pinterest, :portrait, :sample_production, :short_run, :soft_delete, :title, :top_image, :slug, :turnaround_time, :twitter,
      :video_link, :website, :youtube, :year_founded,
      :film_ready,
      :been_visited,
      :is_verified,
      :bespoke_one_offs,
      :works_with_general_public,
      :works_with_large_business,
      :works_with_professionals,
      :works_with_small_companies,
      :works_with_students,
      :batch_production,
      :production_access,
      :production_specifics,
      region_ids: [],
      slider_images: [],
      user_ids: [],
      material_ids: [],
      industry_taxonomy_ids: [],
      process_taxonomy_ids: [],
      production_access_ids: [],
      finished_products_taxonomy_ids: [],
      manufacturer_taxonomy_ids: [],
      machines_taxonomy_ids: []
    )
      .merge(user_id: current_user.id)
  end
end
