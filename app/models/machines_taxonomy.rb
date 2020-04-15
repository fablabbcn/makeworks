class MachinesTaxonomy < ApplicationRecord
  belongs_to :parent, class_name: 'MachinesTaxonomy', optional: true
  has_many :children, class_name: 'MachinesTaxonomy', foreign_key: 'parent_id'
  has_many :machines, dependent: :destroy
end
