class CreateCharacterTags < ActiveRecord::Migration[6.1]
  def change
    create_table :character_tags do |t|
      t.string :name
      t.boolean :is_promoted

      t.timestamps
    end
  end
end
