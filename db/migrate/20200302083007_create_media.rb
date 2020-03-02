class CreateMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :media do |t|
      t.string :m_id
      t.references :company#, null: false, foreign_key: true
      t.string :thumbnail_url
      t.string :web_url
      t.string :hi_res

      t.timestamps
    end
  end
end
