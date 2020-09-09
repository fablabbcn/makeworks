class ProcessTaxonomy < ApplicationRecord
  belongs_to :parent, class_name: 'ProcessTaxonomy', optional: true
  has_many :children, class_name: 'ProcessTaxonomy', foreign_key: 'parent_id'

  has_many :company_processes, dependent: :destroy
  has_many :companies, through: :company_processes
end
