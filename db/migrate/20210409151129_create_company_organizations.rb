class CreateCompanyOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :company_organizations do |t|
      t.references :region, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
