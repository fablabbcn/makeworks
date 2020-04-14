class CreateFinishedProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :finished_products do |t|
      t.references :company, null: false, foreign_key: true
      t.references :finished_products_taxonomy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
