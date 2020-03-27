class Blog < ApplicationRecord
  belongs_to :blog_category, optional: true, class_name: 'BlogCategory'
  belongs_to :medium, optional: true
  extend FriendlyId
  friendly_id :title, use: :slugged
end
