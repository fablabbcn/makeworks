class Taxonomy < ApplicationRecord
  belongs_to :parent, class_name: 'Taxonomy', optional: true
  has_many :children, class_name: 'Taxonomy', foreign_key: 'parent_id'
end
