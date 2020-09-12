class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def to_s
    self.try(:name)
  end

  def self.with_lat_lng
    where.not(lat: nil).where.not(lng: nil)
  end
end
