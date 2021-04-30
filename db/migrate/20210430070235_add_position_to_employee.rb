class AddPositionToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :position, :integer
  end
end
