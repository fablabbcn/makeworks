class AddSlugToManufacturerTaxonomies < ActiveRecord::Migration[6.1]
  def change
    add_column :manufacturer_taxonomies, :slug, :string
    add_index :manufacturer_taxonomies, :slug, unique: true
  end
end
