class IndustryTaxonomy < ApplicationRecord
  belongs_to :parent, class_name: 'IndustryTaxonomy', optional: true
  has_many :children, class_name: 'IndustryTaxonomy', foreign_key: 'parent_id'
end
