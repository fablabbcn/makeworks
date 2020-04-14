class CompanyProcess < ApplicationRecord
  belongs_to :company
  belongs_to :process_taxonomy
end
