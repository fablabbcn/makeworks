class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :m_id
      t.references :region, null: false, foreign_key: true
      t.string :country
      t.string :address
      t.string :background
      t.string :file_types
      t.string :intro
      t.boolean :large_run
      t.float :lat
      t.float :lng
      t.string :location
      t.boolean :medium_run
      t.string :minimum_order
      t.string :name
      t.string :number_of_staff
      t.string :photo1
      t.string :photo2
      t.string :photo3
      t.string :photo4
      t.string :photo5
      t.string :photo6
      t.string :photo7
      t.string :photo8
      t.string :photo9
      t.string :portrait
      t.boolean :sample_production
      t.boolean :short_run
      t.boolean :soft_delete
      t.string :top_image
      t.string :video_link
      t.string :website
      t.string :year_founded

      t.timestamps
    end
  end
end
