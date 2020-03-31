ActiveAdmin.register Blog do
  controller do
    defaults finder: :find_by_slug
  end

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
