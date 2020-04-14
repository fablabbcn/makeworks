class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.references :company, null: false, foreign_key: true
      t.references :materials_taxonomy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
