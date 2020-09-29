class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def to_s
    self.try(:name)
  end

  def self.with_lat_lng
    where.not(lat: nil).where.not(lng: nil)
  end

  def has_lat_lng?
    lat.present? && lng.present?
  end

end
