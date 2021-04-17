class CreateBlogTags < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_tags do |t|
      t.references :blog, null: false, foreign_key: true
      t.references :blog_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
