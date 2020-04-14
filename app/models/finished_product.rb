class FinishedProduct < ApplicationRecord
  belongs_to :company
  belongs_to :finished_products_taxonomy
end
