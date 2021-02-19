ActiveAdmin.register Company do
  includes :region

  controller do
    defaults finder: :find_by_trimmed_name
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :m_id, :region_id, :country, :address, :background, :file_types, :intro,
    :large_run, :lat, :lng, :location, :medium_run, :minimum_order, :name, :number_of_staff,
    :is_verified,
    :photo1, :photo2, :photo3, :photo4, :photo5, :photo6, :photo7, :photo8, :photo9, :portrait,
    :sample_production, :short_run, :soft_delete, :top_image, :video_link, :website, :year_founded
  #
  # or
  #
  # permit_params do
  #   permitted = [:m_id, :region_id, :country, :address, :background, :file_types, :intro, :large_run, :lat, :lng, :location, :medium_run, :minimum_order, :name, :number_of_staff, :photo1, :photo2, :photo3, :photo4, :photo5, :photo6, :photo7, :photo8, :photo9, :portrait, :sample_production, :short_run, :soft_delete, :top_image, :video_link, :website, :year_founded]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  scope :all
  scope :verified
  scope :unverified

  batch_action :toggle_verified do |ids|
    batch_action_collection.find(ids).each do |item|
      item.toggle!(:is_verified)
    end
    redirect_back fallback_location: { action: :index }
  end

  remove_filter :user
  remove_filter :region
  remove_filter :finished_products
  remove_filter :company_processes
  remove_filter :machines
  remove_filter :materials
  remove_filter :industries
  remove_filter :manufacturers
  remove_filter :slider_images_attachments
  remove_filter :slider_images_blobs

  index do
    selectable_column
    id_column
    column :is_verified
    column :region
    column :name
    column :address do |x|
      truncate(x.intro)
    end
    column :background do |x|
      truncate(x.background)
    end
    column :description do |x|
      truncate(x.intro)
    end
    column :intro do |x|
      truncate(x.intro)
    end
    column :contact_name
    column :contact_email
    column :large_run
    column :lat
    column :lng
    column :location
    column :medium_run
    column :minimum_order
    column :number_of_staff
    column :sample_production
    column :short_run
    column :soft_delete
    column :turnaround_time
    column :year_founded
    column :film_ready
    column :been_visited
    column :bespoke_one_offs
    actions
  end
end
