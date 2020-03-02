class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :m_id
      t.string :blurb
      t.references :blog_category, foreign_key: true
      t.text :content
      t.boolean :dont_publish
      t.string :featured_video
      t.string :header_image
      t.references :medium, foreign_key: true
      t.string :slug
      t.string :sub_title
      t.string :title

      t.timestamps
    end
  end
end
