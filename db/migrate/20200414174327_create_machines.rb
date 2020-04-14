class CreateMachines < ActiveRecord::Migration[6.0]
  def change
    create_table :machines do |t|
      t.references :company, null: false, foreign_key: true
      t.references :machines_taxonomy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
