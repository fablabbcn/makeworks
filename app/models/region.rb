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

  def should_generate_new_friendly_id?
    trimmed_name.blank? || name_changed?
  end
end
