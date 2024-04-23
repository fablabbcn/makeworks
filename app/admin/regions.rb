ActiveAdmin.register Region do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :m_id, :name, :can_signup, :is_public, :logo, :slug, :lat, :lng, aliases_attributes: [:alias, :id, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:m_id, :name, :can_signup, :is_public, :logo, :slug]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  scope :all
  scope :is_public


  show do
    default_main_content
    h3 "Aliases:"
    table_for region.aliases do |region_alias|
      column :alias
    end
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.has_many :aliases, new_record: "New alias", remove_record: "Remove alias", allow_destroy: true do |alias_f|
      alias_f.input :alias, as: :string
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
