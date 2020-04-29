class AddWorksWithToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :been_visited, :boolean
    add_column :companies, :bespoke_one_offs, :boolean
    add_column :companies, :works_with_general_public, :boolean
    add_column :companies, :works_with_large_business, :boolean
    add_column :companies, :works_with_professionals, :boolean
    add_column :companies, :works_with_small_companies, :boolean
    add_column :companies, :works_with_students, :boolean
    add_column :companies, :batch_production, :boolean
    add_column :companies, :production_access, :string
  end
end
