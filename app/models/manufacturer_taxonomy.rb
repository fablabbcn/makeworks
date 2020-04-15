class ManufacturerTaxonomy < ApplicationRecord
  belongs_to :parent, class_name: 'ManufacturerTaxonomy', optional: true
  has_many :children, class_name: 'ManufacturerTaxonomy', foreign_key: 'parent_id', inverse_of: 'parent', dependent: :nullify
  has_many :manufacturers, dependent: :destroy
end
