class RegionAlias < ApplicationRecord
  belongs_to :region
  validates :alias, presence: true
end
