class AddLatToRegions < ActiveRecord::Migration[6.0]
  def change
    add_column :regions, :lat, :float
    add_column :regions, :lng, :float
  end
end
