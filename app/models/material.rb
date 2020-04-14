class Material < ApplicationRecord
  belongs_to :company
  belongs_to :materials_taxonomy
end
