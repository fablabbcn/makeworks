class ManufacturerTaxonomy < ApplicationRecord
  belongs_to :parent, class_name: 'ManufacturerTaxonomy', optional: true
  has_many :children, class_name: 'ManufacturerTaxonomy', foreign_key: 'parent_id'
end
