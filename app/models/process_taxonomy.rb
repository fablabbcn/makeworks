class ProcessTaxonomy < ApplicationRecord
  belongs_to :parent, class_name: 'ProcessTaxonomy', optional: true
  has_many :children, class_name: 'ProcessTaxonomy', foreign_key: 'parent_id'
end
