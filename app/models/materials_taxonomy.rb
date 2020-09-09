class MaterialsTaxonomy < ApplicationRecord
  belongs_to :parent, class_name: 'MaterialsTaxonomy', optional: true
  has_many :children, class_name: 'MaterialsTaxonomy', foreign_key: 'parent_id'

  has_many :materials, dependent: :destroy
  has_many :companies, through: :materials
end
