class CreateManufacturerTaxonomies < ActiveRecord::Migration[6.0]
  def change
    create_table :manufacturer_taxonomies do |t|
      t.string :m_id
      t.string :name
      t.belongs_to :parent#, null: false, foreign_key: true

      t.timestamps
    end
  end
end
