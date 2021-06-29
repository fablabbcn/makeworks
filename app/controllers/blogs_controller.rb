class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :only_admins, only: [:new, :create, :edit, :destroy, :update]

  def only_admins
    if current_user.is_admin?
    else
      flash[:error] = 'Only admins can create and edit blogs'
      if @blog
        redirect_to @blog
      else
        redirect_to blogs_url
      end
    end
  end

  # GET /blogs
  # GET /blogs.json
  def index
    @q = Blog
      .where(dont_publish: false)
      .order(created_at: :desc)
      .ransack(params[:q])

    @blogs = @q.result(distinct: true).page(params[:page])
    render layout: 'blank'
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @recent = Blog
      .where(dont_publish: false)
      .order(created_at: :desc)
      .limit(4)
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog
        .includes(blog_tags: [:blog_category])
        .friendly
        .find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(
        :m_id,
        :blurb,
        :content_action,
        :dont_publish,
        :featured_video,
        :header_image,
        :medium_id,
        :slug,
        :sub_title,
        :user_id,
        :title,
        blog_category_ids: []
      )
    end
end
