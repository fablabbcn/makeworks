class Manufacturer < ApplicationRecord
  belongs_to :company
  belongs_to :manufacturer_taxonomy
end
