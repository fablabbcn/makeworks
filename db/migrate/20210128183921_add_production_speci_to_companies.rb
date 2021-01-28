class AddProductionSpeciToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :production_specifics, :text
  end
end
