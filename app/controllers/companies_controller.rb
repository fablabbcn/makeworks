class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :who_can_edit!, only: [:edit, :destroy, :update, :delete_image_attachment]
  before_action :index, only: [:advanced] #reuse the index on /companies_advanced

  def who_can_edit!
    if current_user && (current_user.is_champion_in_region(@company&.region&.id) || current_user.is_admin?)
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

  # GET /companies
  # GET /companies.json
  def index
    @q = Company
      .includes(:region)
      .where(regions: { is_public: true })
      .where(is_verified: true)
      .ransack(params[:q])

    @companies = @q.result(distinct: true).page(params[:page])
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
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
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    # use bullet gem
    @company = Company.includes(
      company_processes: [:process_taxonomy],
      #finished_products: [:finished_products_taxonomy],
      materials: [:materials_taxonomy],
      #industries: [:industry_taxonomy],
      machines: [:machines_taxonomy]
    )
      .friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(
      :m_id,
      :region_id,
      :name, :address,
      :background,
      :description, :intro, :contact_name, :contact_email,
      :contact_phone, :contact_jobtitle, :flickr, :facebook, :instagram,
      :large_run, :lat, :lng, :linkedin, :location,
      :medium_run, :minimum_order, :number_of_staff, :file_types,
      :image_bucket, :photo1, :photo2, :photo3, :photo4, :photo5, :photo6, :photo7, :photo8, :photo9, :pinterest, :portrait, :sample_production, :short_run, :soft_delete, :title, :top_image, :trimmed_name, :turnaround_time, :twitter,
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
      slider_images: [],
      materials_taxonomy_ids: [],
      industry_taxonomy_ids: [],
      process_taxonomy_ids: [],
      finished_products_taxonomy_ids: [],
      manufacturer_taxonomy_ids: [],
      machines_taxonomy_ids: [])
  end
end
