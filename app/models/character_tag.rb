class CharacterTag < ApplicationRecord
  has_many :character_taggings, dependent: :destroy

  scope :promoted, -> { where(is_promoted: true) }
end
