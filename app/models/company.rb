class Company < ApplicationRecord
  belongs_to :region
  has_many :finished_products, dependent: :destroy
  has_many :company_processes, dependent: :destroy
  has_many :industries, dependent: :destroy
  has_many :materials, dependent: :destroy
  has_many :manufacturers, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged, slug_column: :trimmed_name
end
