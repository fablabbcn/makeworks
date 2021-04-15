class AddSlugToMaterials < ActiveRecord::Migration[6.1]
  def change
    add_column :materials, :slug, :string
    add_index :materials, :slug, unique: true
  end
end
