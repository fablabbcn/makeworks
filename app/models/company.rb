class Company < ApplicationRecord
  belongs_to :region
  extend FriendlyId
  friendly_id :name, use: :slugged, slug_column: :trimmed_name
end
