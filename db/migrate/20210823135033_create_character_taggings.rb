class CreateCharacterTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :character_taggings do |t|
      t.belongs_to :character_tag, null: false, foreign_key: true
      t.belongs_to :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
