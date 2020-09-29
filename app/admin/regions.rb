ActiveAdmin.register Region do
  controller do
    defaults finder: :find_by_trimmed_name
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :m_id, :name, :can_signup, :is_public, :logo, :trimmed_name, :lat, :lng
  #
  # or
  #
  # permit_params do
  #   permitted = [:m_id, :name, :can_signup, :is_public, :logo, :trimmed_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
