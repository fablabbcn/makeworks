class MachinesTaxonomiesController < ApplicationController
  before_action :set_machines_taxonomy, only: [:show, :edit, :update, :destroy]

  # GET /machines_taxonomies
  # GET /machines_taxonomies.json
  def index
    @machines_taxonomies = MachinesTaxonomy.all
  end

  # GET /machines_taxonomies/1
  # GET /machines_taxonomies/1.json
  def show
  end

  # GET /machines_taxonomies/new
  def new
    @machines_taxonomy = MachinesTaxonomy.new
  end

  # GET /machines_taxonomies/1/edit
  def edit
  end

  # POST /machines_taxonomies
  # POST /machines_taxonomies.json
  def create
    @machines_taxonomy = MachinesTaxonomy.new(machines_taxonomy_params)

    respond_to do |format|
      if @machines_taxonomy.save
        format.html { redirect_to @machines_taxonomy, notice: 'Machines taxonomy was successfully created.' }
        format.json { render :show, status: :created, location: @machines_taxonomy }
      else
        format.html { render :new }
        format.json { render json: @machines_taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machines_taxonomies/1
  # PATCH/PUT /machines_taxonomies/1.json
  def update
    respond_to do |format|
      if @machines_taxonomy.update(machines_taxonomy_params)
        format.html { redirect_to @machines_taxonomy, notice: 'Machines taxonomy was successfully updated.' }
        format.json { render :show, status: :ok, location: @machines_taxonomy }
      else
        format.html { render :edit }
        format.json { render json: @machines_taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machines_taxonomies/1
  # DELETE /machines_taxonomies/1.json
  def destroy
    @machines_taxonomy.destroy
    respond_to do |format|
      format.html { redirect_to machines_taxonomies_url, notice: 'Machines taxonomy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machines_taxonomy
      @machines_taxonomy = MachinesTaxonomy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def machines_taxonomy_params
      params.require(:machines_taxonomy).permit(:m_id, :name, :parent_id)
    end
end
