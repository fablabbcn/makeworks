class ProcessTaxonomiesController < ApplicationController
  before_action :set_process_taxonomy, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin

  # GET /process_taxonomies
  # GET /process_taxonomies.json
  def index
    @process_taxonomies = ProcessTaxonomy.all
  end

  # GET /process_taxonomies/1
  # GET /process_taxonomies/1.json
  def show
  end

  # GET /process_taxonomies/new
  def new
    @process_taxonomy = ProcessTaxonomy.new
  end

  # GET /process_taxonomies/1/edit
  def edit
  end

  # POST /process_taxonomies
  # POST /process_taxonomies.json
  def create
    @process_taxonomy = ProcessTaxonomy.new(process_taxonomy_params)

    respond_to do |format|
      if @process_taxonomy.save
        format.html { redirect_to @process_taxonomy, notice: 'Process taxonomy was successfully created.' }
        format.json { render :show, status: :created, location: @process_taxonomy }
      else
        format.html { render :new }
        format.json { render json: @process_taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /process_taxonomies/1
  # PATCH/PUT /process_taxonomies/1.json
  def update
    respond_to do |format|
      if @process_taxonomy.update(process_taxonomy_params)
        format.html { redirect_to @process_taxonomy, notice: 'Process taxonomy was successfully updated.' }
        format.json { render :show, status: :ok, location: @process_taxonomy }
      else
        format.html { render :edit }
        format.json { render json: @process_taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /process_taxonomies/1
  # DELETE /process_taxonomies/1.json
  def destroy
    @process_taxonomy.destroy
    respond_to do |format|
      format.html { redirect_to process_taxonomies_url, notice: 'Process taxonomy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_process_taxonomy
      @process_taxonomy = ProcessTaxonomy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def process_taxonomy_params
      params.require(:process_taxonomy).permit(:m_id, :name, :parent_id)
    end
end
