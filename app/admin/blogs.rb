ActiveAdmin.register Blog do
  controller do
    defaults finder: :find_by_slug
  end

  scope :all
  scope :published
  scope :hidden

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :blurb, :blog_category_id, :dont_publish, :featured_video, :header_image, :sub_title, :title
  #
  # or
  #
  # permit_params do
  #   permitted = [:m_id, :blurb, :blog_category_id, :content, :dont_publish, :featured_video, :header_image, :medium_id, :slug, :sub_title, :title]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  member_action :enable, method: :put do
    thing = Blog.find(params[:id])
    thing.toggle!(:dont_publish)
    flash[:notice] = "Blog publish has been changed!"
    redirect_back fallback_location: { action: :index }
  end

  remove_filter :medium
  remove_filter :rich_text_content_action
  remove_filter :m_id

  index do

    selectable_column
    id_column
    column :title
    column :sub_title
    column :slug
    column :blurb
    column :dont_publish do |thing|
      link_to (thing.dont_publish? ? "Show post" : "Hide post"), url_for(action: :enable, id: thing.id), method: :put
    end
    column :dont_publish
    column :created_at
    column :updated_at
    column :content do |c|
      truncate(c.content, length: 100)
    end
    column :header_image
    column :featured_video
    actions
  end

  form do |f|
    f.inputs do
      f.input :blog_category
      f.input :title
      #f.rich_text_area :content_action
      f.input :dont_publish
      f.input :sub_title
      f.input :blurb
      f.input :slug
      f.input :featured_video
      actions
    end
  end
end
