class FinishedProductsTaxonomy < ApplicationRecord
  belongs_to :parent, class_name: 'FinishedProductsTaxonomy', optional: true
  has_many :children, class_name: 'FinishedProductsTaxonomy', foreign_key: 'parent_id'

  has_many :finished_products, dependent: :destroy
  has_many :companies, through: :finished_products

  default_scope { order(name: :asc) }

  validates :slug, uniqueness: true
  extend FriendlyId
  friendly_id :name, use: :slugged
end
