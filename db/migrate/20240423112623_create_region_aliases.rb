class CreateRegionAliases < ActiveRecord::Migration[7.0]
  def change
    create_table :region_aliases do |t|
      t.integer :region_id
      t.text :alias

      t.timestamps
    end
  end
end
