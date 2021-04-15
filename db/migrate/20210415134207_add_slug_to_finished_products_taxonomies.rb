class AddSlugToFinishedProductsTaxonomies < ActiveRecord::Migration[6.1]
  def change
    add_column :finished_products_taxonomies, :slug, :string
    add_index :finished_products_taxonomies, :slug, unique: true
  end
end
