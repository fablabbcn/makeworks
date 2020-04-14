class Company < ApplicationRecord
  belongs_to :region
  has_many :finished_products
  has_many :company_processes

  extend FriendlyId
  friendly_id :name, use: :slugged, slug_column: :trimmed_name
end
