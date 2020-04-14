class Machine < ApplicationRecord
  belongs_to :company
  belongs_to :machines_taxonomy
end
