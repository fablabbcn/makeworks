class Company < ApplicationRecord
  belongs_to :region
  has_many :finished_products, dependent: :destroy
  has_many :company_processes, dependent: :destroy

  has_many :industries, dependent: :destroy
  has_many :industry_taxonomies, through: :industries

  has_many :materials, dependent: :destroy
  has_many :materials_taxonomies, through: :materials

  has_many :manufacturers, dependent: :destroy

  has_many :machines, dependent: :destroy
  has_many :machines_taxonomies, through: :machines

  extend FriendlyId
  friendly_id :name, use: :slugged, slug_column: :trimmed_name


  def self.companies_with_lat_lng
    where.not(lat: nil).where.not(lng: nil)
  end
end
