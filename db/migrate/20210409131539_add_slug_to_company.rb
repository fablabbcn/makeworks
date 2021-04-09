class AddSlugToCompany < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :slug, :string
    remove_column :companies, :trimmed_name, :string
    add_index :companies, :slug, unique: true
  end
end
