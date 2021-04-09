class RemoveRegionFromCompany < ActiveRecord::Migration[6.1]
  def change
    remove_reference :companies, :region, null: false, foreign_key: true
  end
end
