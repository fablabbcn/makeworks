class RemoveBlogCategoryFromBlog < ActiveRecord::Migration[6.1]
  def change
    remove_reference :blogs, :blog_category, null: false, foreign_key: true
  end
end
