class CharacterTagsController < ApplicationController
  before_action :set_character_tag, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin, only: [:new, :create, :edit, :destroy, :update]

  # GET /character_tags
  # GET /character_tags.json
  def index
    @character_tags = CharacterTag.all
  end

  # GET /character_tags/1
  # GET /character_tags/1.json
  def show
  end

  # GET /character_tags/new
  def new
    @character_tag = CharacterTag.new
  end

  # GET /character_tags/1/edit
  def edit
  end

  # POST /character_tags
  # POST /character_tags.json
  def create
    @character_tag = CharacterTag.new(character_tag_params)

    respond_to do |format|
      if @character_tag.save
        format.html { redirect_to @character_tag, notice: 'Character tag was successfully created.' }
        format.json { render :show, status: :created, location: @character_tag }
      else
        format.html { render :new }
        format.json { render json: @character_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_tags/1
  # PATCH/PUT /character_tags/1.json
  def update
    respond_to do |format|
      if @character_tag.update(character_tag_params)
        format.html { redirect_to @character_tag, notice: 'Character tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_tag }
      else
        format.html { render :edit }
        format.json { render json: @character_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_tags/1
  # DELETE /character_tags/1.json
  def destroy
    @character_tag.destroy
    respond_to do |format|
      format.html { redirect_to character_tags_url, notice: 'Character tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_tag
      @character_tag = CharacterTag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_tag_params
      params.require(:character_tag).permit(:name)
    end
end
