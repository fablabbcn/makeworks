class IndustryTaxonomy < ApplicationRecord
  belongs_to :parent, class_name: 'IndustryTaxonomy', optional: true
  has_many :children, class_name: 'IndustryTaxonomy', foreign_key: 'parent_id'

  has_many :industries, dependent: :destroy
  has_many :companies, through: :industries

  validates :slug, uniqueness: true
  extend FriendlyId
  friendly_id :name, use: :slugged
end
