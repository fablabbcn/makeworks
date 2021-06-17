class AddWordsToBlog < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :words_by_author, :string
  end
end
