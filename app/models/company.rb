class Company < ApplicationRecord
  belongs_to :region
  has_many :finished_products

  extend FriendlyId
  friendly_id :name, use: :slugged, slug_column: :trimmed_name
end
