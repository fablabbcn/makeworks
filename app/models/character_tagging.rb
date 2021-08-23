class CharacterTagging < ApplicationRecord
  belongs_to :character_tag
  belongs_to :company
end
