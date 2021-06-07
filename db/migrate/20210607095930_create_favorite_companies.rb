class CreateFavoriteCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_companies do |t|
      t.string :note
      t.boolean :is_favorite
      t.references :company, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
