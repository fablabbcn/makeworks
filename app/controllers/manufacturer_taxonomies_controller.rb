class ManufacturerTaxonomiesController < ApplicationController
  before_action :set_manufacturer_taxonomy, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin, except: [:index, :show]
  skip_before_action :authenticate_user!, only: [:show, :index]

  # GET /manufacturer_taxonomies
  # GET /manufacturer_taxonomies.json
  def index
    @manufacturer_taxonomies = ManufacturerTaxonomy.all
  end

  # GET /manufacturer_taxonomies/1
  # GET /manufacturer_taxonomies/1.json
  def show
  end

  # GET /manufacturer_taxonomies/new
  def new
    @manufacturer_taxonomy = ManufacturerTaxonomy.new
  end

  # GET /manufacturer_taxonomies/1/edit
  def edit
  end

  # POST /manufacturer_taxonomies
  # POST /manufacturer_taxonomies.json
  def create
    @manufacturer_taxonomy = ManufacturerTaxonomy.new(manufacturer_taxonomy_params)

    respond_to do |format|
      if @manufacturer_taxonomy.save
        format.html { redirect_to @manufacturer_taxonomy, notice: 'Manufacturer taxonomy was successfully created.' }
        format.json { render :show, status: :created, location: @manufacturer_taxonomy }
      else
        format.html { render :new }
        format.json { render json: @manufacturer_taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manufacturer_taxonomies/1
  # PATCH/PUT /manufacturer_taxonomies/1.json
  def update
    respond_to do |format|
      if @manufacturer_taxonomy.update(manufacturer_taxonomy_params)
        format.html { redirect_to @manufacturer_taxonomy, notice: 'Manufacturer taxonomy was successfully updated.' }
        format.json { render :show, status: :ok, location: @manufacturer_taxonomy }
      else
        format.html { render :edit }
        format.json { render json: @manufacturer_taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manufacturer_taxonomies/1
  # DELETE /manufacturer_taxonomies/1.json
  def destroy
    @manufacturer_taxonomy.destroy
    respond_to do |format|
      format.html { redirect_to manufacturer_taxonomies_url, notice: 'Manufacturer taxonomy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manufacturer_taxonomy
      @manufacturer_taxonomy = ManufacturerTaxonomy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def manufacturer_taxonomy_params
      params.require(:manufacturer_taxonomy).permit(:m_id, :name, :parent_id)
    end
end
