class AddSlugToProcessTaxonomies < ActiveRecord::Migration[6.1]
  def change
    add_column :process_taxonomies, :slug, :string
    add_index :process_taxonomies, :slug, unique: true
  end
end
