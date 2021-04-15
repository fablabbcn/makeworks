class AddSlugToIndustryTaxonomies < ActiveRecord::Migration[6.1]
  def change
    add_column :industry_taxonomies, :slug, :string
    add_index :industry_taxonomies, :slug, unique: true
  end
end
