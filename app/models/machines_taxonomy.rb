class MachinesTaxonomy < ApplicationRecord
  default_scope { order(created_at: :asc) }
  belongs_to :parent, class_name: 'MachinesTaxonomy', optional: true
  has_many :children, class_name: 'MachinesTaxonomy', foreign_key: 'parent_id'

  has_many :machines, dependent: :destroy
  has_many :companies, through: :machines

  extend FriendlyId
  friendly_id :name, use: :slugged

end
