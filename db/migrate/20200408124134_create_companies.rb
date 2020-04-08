class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :m_id
      t.references :region, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.text :background
      t.text :description
      t.text :intro
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.string :contact_jobtitle
      t.string :flickr
      t.string :facebook
      t.string :instagram
      t.boolean :large_run
      t.float :lat
      t.float :lng
      t.string :linkedin
      t.string :location
      t.boolean :medium_run
      t.string :minimum_order
      t.integer :number_of_staff
      t.string :file_types
      t.string :image_bucket
      t.string :photo1
      t.string :photo2
      t.string :photo3
      t.string :photo4
      t.string :photo5
      t.string :photo6
      t.string :photo7
      t.string :photo8
      t.string :photo9
      t.string :pinterest
      t.string :portrait
      t.boolean :sample_production
      t.boolean :short_run
      t.boolean :soft_delete
      t.string :title
      t.string :top_image
      t.string :trimmed_name
      t.string :turnaround_time
      t.string :twitter
      t.string :video_link
      t.string :website
      t.string :youtube
      t.integer :year_founded
      t.boolean :film_ready

      t.timestamps
    end
  end
end
