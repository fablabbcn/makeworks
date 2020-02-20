class CreateUserRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_regions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
