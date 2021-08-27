class Region < ApplicationRecord
  has_many :user_regions, dependent: :destroy
  has_many :users, through: :user_regions

  has_many :company_organization, dependent: :destroy
  has_many :companies, through: :company_organization

  default_scope { order(name: :asc) }
  scope :is_public, -> { where(is_public: true) }

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_rich_text :short_info
  has_one_attached :avatar
  has_rich_text :short_description
  has_rich_text :about_text
  has_rich_text :partner_text
  has_many_attached :partner_logos

  def champions
    UserRegion.where(region: self, is_champion: true)
  end

  def should_generate_new_friendly_id?
    slug.blank?
  end
end
