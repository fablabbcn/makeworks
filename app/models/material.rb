class Material < ApplicationRecord
  belongs_to :parent, class_name: 'Material', optional: true
  has_many :children, class_name: 'Material', foreign_key: 'parent_id'

  has_many :material_tags, dependent: :destroy
  has_many :companies, through: :material_tags

  default_scope { order(name: :asc) }

  validates :slug, uniqueness: true
  extend FriendlyId
  friendly_id :name, use: :slugged
end
