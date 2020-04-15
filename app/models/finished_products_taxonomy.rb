class FinishedProductsTaxonomy < ApplicationRecord
  belongs_to :parent, class_name: 'FinishedProductsTaxonomy', optional: true
  has_many :children, class_name: 'FinishedProductsTaxonomy', foreign_key: 'parent_id'
  has_many :finished_products, dependent: :destroy
end
