class CreateCompanyProductionAccesses < ActiveRecord::Migration[6.1]
  def change
    create_table :company_production_accesses do |t|
      t.references :company, null: false, foreign_key: true
      t.references :production_access, null: false, foreign_key: true

      t.timestamps
    end
  end
end
