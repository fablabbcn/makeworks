class AddSlugToMachinesTaxonomies < ActiveRecord::Migration[6.1]
  def change
    add_column :machines_taxonomies, :slug, :string
    add_index :machines_taxonomies, :slug, unique: true
  end
end
