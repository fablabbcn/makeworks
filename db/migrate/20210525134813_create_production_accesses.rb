class CreateProductionAccesses < ActiveRecord::Migration[6.1]
  def change
    create_table :production_accesses do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
