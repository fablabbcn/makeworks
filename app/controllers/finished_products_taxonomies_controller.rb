class FinishedProductsTaxonomiesController < ApplicationController
  before_action :set_finished_products_taxonomy, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin, except: [:index, :show]
  skip_before_action :authenticate_user!, only: [:show, :index]

  # GET /finished_products_taxonomies
  # GET /finished_products_taxonomies.json
  def index
    @finished_products_taxonomies = FinishedProductsTaxonomy
      .includes(:parent)
      .page(params[:page])
  end

  # GET /finished_products_taxonomies/1
  # GET /finished_products_taxonomies/1.json
  def show
  end

  # GET /finished_products_taxonomies/new
  def new
    @finished_products_taxonomy = FinishedProductsTaxonomy.new
  end

  # GET /finished_products_taxonomies/1/edit
  def edit
  end

  # POST /finished_products_taxonomies
  # POST /finished_products_taxonomies.json
  def create
    @finished_products_taxonomy = FinishedProductsTaxonomy.new(finished_products_taxonomy_params)

    respond_to do |format|
      if @finished_products_taxonomy.save
        format.html { redirect_to @finished_products_taxonomy, notice: 'Finished products taxonomy was successfully created.' }
        format.json { render :show, status: :created, location: @finished_products_taxonomy }
      else
        format.html { render :new }
        format.json { render json: @finished_products_taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /finished_products_taxonomies/1
  # PATCH/PUT /finished_products_taxonomies/1.json
  def update
    respond_to do |format|
      if @finished_products_taxonomy.update(finished_products_taxonomy_params)
        format.html { redirect_to @finished_products_taxonomy, notice: 'Finished products taxonomy was successfully updated.' }
        format.json { render :show, status: :ok, location: @finished_products_taxonomy }
      else
        format.html { render :edit }
        format.json { render json: @finished_products_taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finished_products_taxonomies/1
  # DELETE /finished_products_taxonomies/1.json
  def destroy
    @finished_products_taxonomy.destroy
    respond_to do |format|
      format.html { redirect_to finished_products_taxonomies_url, notice: 'Finished products taxonomy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_finished_products_taxonomy
      @finished_products_taxonomy = FinishedProductsTaxonomy.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def finished_products_taxonomy_params
      params.require(:finished_products_taxonomy).permit(:m_id, :name, :parent_id)
    end
end
