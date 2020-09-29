class MaterialsTaxonomiesController < ApplicationController
  before_action :set_materials_taxonomy, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin, except: [:index, :show]
  skip_before_action :authenticate_user!, only: [:show, :index]

  # GET /materials_taxonomies
  # GET /materials_taxonomies.json
  def index
    @materials_taxonomies = MaterialsTaxonomy.all.page(params[:page])
  end

  # GET /materials_taxonomies/1
  # GET /materials_taxonomies/1.json
  def show
  end

  # GET /materials_taxonomies/new
  def new
    @materials_taxonomy = MaterialsTaxonomy.new
  end

  # GET /materials_taxonomies/1/edit
  def edit
  end

  # POST /materials_taxonomies
  # POST /materials_taxonomies.json
  def create
    @materials_taxonomy = MaterialsTaxonomy.new(materials_taxonomy_params)

    respond_to do |format|
      if @materials_taxonomy.save
        format.html { redirect_to @materials_taxonomy, notice: 'Materials taxonomy was successfully created.' }
        format.json { render :show, status: :created, location: @materials_taxonomy }
      else
        format.html { render :new }
        format.json { render json: @materials_taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materials_taxonomies/1
  # PATCH/PUT /materials_taxonomies/1.json
  def update
    respond_to do |format|
      if @materials_taxonomy.update(materials_taxonomy_params)
        format.html { redirect_to @materials_taxonomy, notice: 'Materials taxonomy was successfully updated.' }
        format.json { render :show, status: :ok, location: @materials_taxonomy }
      else
        format.html { render :edit }
        format.json { render json: @materials_taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials_taxonomies/1
  # DELETE /materials_taxonomies/1.json
  def destroy
    @materials_taxonomy.destroy
    respond_to do |format|
      format.html { redirect_to materials_taxonomies_url, notice: 'Materials taxonomy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materials_taxonomy
      @materials_taxonomy = MaterialsTaxonomy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def materials_taxonomy_params
      params.require(:materials_taxonomy).permit(:m_id, :name, :parent_id)
    end
end
