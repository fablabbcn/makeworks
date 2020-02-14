class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :m_id
      t.string :name
      t.boolean :can_signup
      t.boolean :is_public
      t.string :logo
      t.string :trimmed_name

      t.timestamps
    end
  end
end
