class CompanyProductionAccess < ApplicationRecord
  belongs_to :company
  belongs_to :production_access
end
