class Industry < ApplicationRecord
  belongs_to :company
  belongs_to :industry_taxonomy
end
