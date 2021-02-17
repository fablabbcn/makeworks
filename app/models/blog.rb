class Blog < ApplicationRecord
  belongs_to :blog_category, optional: true, class_name: 'BlogCategory'
  belongs_to :medium, optional: true
  default_scope { order(created_at: :desc) }

  scope :published, -> { where.not(dont_publish: true) }
  scope :hidden, -> { where(dont_publish: true) }

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_rich_text :content_action

  paginates_per 20
end
