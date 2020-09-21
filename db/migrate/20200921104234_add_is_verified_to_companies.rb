class AddIsVerifiedToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :is_verified, :boolean
  end
end
