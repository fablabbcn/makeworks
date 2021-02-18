class AddCreatorToCompany < ActiveRecord::Migration[6.0]
  def change
    add_reference :companies, :user, null: true, foreign_key: true
  end
end
