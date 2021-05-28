class Blog < ApplicationRecord
  belongs_to :medium, optional: true

  has_many :blog_tags, dependent: :destroy
  has_many :blog_categories, through: :blog_tags

  scope :published, -> { where.not(dont_publish: true) }
  scope :hidden, -> { where(dont_publish: true) }

  validates :slug, uniqueness: true
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  has_rich_text :content_action

  paginates_per 10
end
