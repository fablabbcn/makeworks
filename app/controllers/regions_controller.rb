class RegionsController < ApplicationController
  before_action :set_region, only: [:show, :edit, :update, :destroy, :leave, :join]
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :who_can_edit!, only: [:edit, :destroy, :update]

  def who_can_edit!
    if current_user && (current_user.is_champion_in_region(@region.id) || current_user.is_admin?)
    else
      flash[:error] = 'Only champions and admins can edit'
      redirect_to @region
    end
  end

  def delete_partner_image
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_back(fallback_location: regions_url)
  end

  # GET /regions
  # GET /regions.json
  def index
    #@q = Region.ransack(params[:q])
    #@regions = @q.result(distinct: true).page(params[:page])

    # Normal users only see public regions
    @regions = Region
      .where(is_public: true)
      .order(:created_at)
      .includes([:rich_text_about_text])
  end

  # GET /regions/1
  # GET /regions/1.json
  def show
  end

  # GET /regions/new
  def new
    @region = Region.new
  end

  # GET /regions/1/edit
  def edit
  end

  def join
    UserRegion.create!(region: @region, user: current_user)
    redirect_to region_url(@region), notice: "You have joined the region #{@region.name}"
  end

  def leave
    UserRegion.where(region: @region, user: current_user).first.destroy!
    redirect_to region_url(@region), notice: "You have left the region #{@region.name}"
  end

  # POST /regions
  # POST /regions.json
  def create
    @region = Region.new(region_params)

    respond_to do |format|
      if @region.save
        format.html { redirect_to @region, notice: 'Region was successfully created.' }
        format.json { render :show, status: :created, location: @region }
      else
        format.html { render :new }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regions/1
  # PATCH/PUT /regions/1.json
  def update
    respond_to do |format|
      if @region.update(region_params)
        format.html { redirect_to @region, notice: 'Region was successfully updated.' }
        format.json { render :show, status: :ok, location: @region }
      else
        format.html { render :edit }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1
  # DELETE /regions/1.json
  def destroy
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_url, notice: 'Region was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_region
    @region = Region.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def region_params
    params.require(:region).permit(
      :m_id,
      :avatar,
      :about_text,
      :short_description,
      :name,
      :can_signup,
      :is_public,
      :logo,
      :trimmed_name,
      :lat,
      :lng,
      :partner_text,
      partner_logos: [],
    )
  end
end
