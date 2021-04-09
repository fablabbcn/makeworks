class CompanyOrganization < ApplicationRecord
  belongs_to :region
  belongs_to :company
end
