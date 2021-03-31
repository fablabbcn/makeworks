class IndustryTaxonomiesController < ApplicationController
  before_action :set_industry_taxonomy, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin, except: [:index, :show]
  skip_before_action :authenticate_user!, only: [:show, :index]

  # GET /industry_taxonomies
  # GET /industry_taxonomies.json
  def index
    @industry_taxonomies = IndustryTaxonomy
      .includes(:parent)
      .page(params[:page])
  end

  # GET /industry_taxonomies/1
  # GET /industry_taxonomies/1.json
  def show
  end

  # GET /industry_taxonomies/new
  def new
    @industry_taxonomy = IndustryTaxonomy.new
  end

  # GET /industry_taxonomies/1/edit
  def edit
  end

  # POST /industry_taxonomies
  # POST /industry_taxonomies.json
  def create
    @industry_taxonomy = IndustryTaxonomy.new(industry_taxonomy_params)

    respond_to do |format|
      if @industry_taxonomy.save
        format.html { redirect_to @industry_taxonomy, notice: 'Industry taxonomy was successfully created.' }
        format.json { render :show, status: :created, location: @industry_taxonomy }
      else
        format.html { render :new }
        format.json { render json: @industry_taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /industry_taxonomies/1
  # PATCH/PUT /industry_taxonomies/1.json
  def update
    respond_to do |format|
      if @industry_taxonomy.update(industry_taxonomy_params)
        format.html { redirect_to @industry_taxonomy, notice: 'Industry taxonomy was successfully updated.' }
        format.json { render :show, status: :ok, location: @industry_taxonomy }
      else
        format.html { render :edit }
        format.json { render json: @industry_taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /industry_taxonomies/1
  # DELETE /industry_taxonomies/1.json
  def destroy
    @industry_taxonomy.destroy
    respond_to do |format|
      format.html { redirect_to industry_taxonomies_url, notice: 'Industry taxonomy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industry_taxonomy
      @industry_taxonomy = IndustryTaxonomy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def industry_taxonomy_params
      params.require(:industry_taxonomy).permit(:m_id, :name, :parent_id)
    end
end
