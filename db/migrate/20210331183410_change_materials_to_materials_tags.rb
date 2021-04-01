class ChangeMaterialsToMaterialsTags < ActiveRecord::Migration[6.1]
  def change
    rename_table :materials, :material_tags
    rename_table :materials_taxonomies, :materials
    rename_column :material_tags, :materials_taxonomy_id, :material_id
  end
end
