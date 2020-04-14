class CreateIndustries < ActiveRecord::Migration[6.0]
  def change
    create_table :industries do |t|
      t.references :company, null: false, foreign_key: true
      t.references :industry_taxonomy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
