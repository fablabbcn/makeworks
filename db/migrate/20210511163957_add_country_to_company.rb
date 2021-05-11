class AddCountryToCompany < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :country_code, :string
  end
end
