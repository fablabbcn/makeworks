class AddSlugToRegion < ActiveRecord::Migration[6.1]
  def change
    add_column :regions, :slug, :string
    remove_column :regions, :trimmed_name, :string
    add_index :regions, :slug, unique: true
  end
end
