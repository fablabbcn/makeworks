class Region < ApplicationRecord
  has_many :user_regions
  has_many :users, through: :user_regions
  has_many :companies
  extend FriendlyId
  friendly_id :name, use: :slugged, slug_column: :trimmed_name

  has_rich_text :about_text

  def champions
    UserRegion.where(region: self, is_champion: true)
  end

  def companies_with_lat_lng
    companies.where.not(lat: nil).where.not(lng: nil)
  end
end
