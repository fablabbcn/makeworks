class AddIndexToBlog < ActiveRecord::Migration[6.1]
  def change
    add_index :blogs, :slug, unique: true
  end
end
