class Company < ApplicationRecord
  belongs_to :region

  has_many :finished_products, dependent: :destroy
  has_many :finished_products_taxonomies, through: :finished_products

  has_many :company_processes, dependent: :destroy
  has_many :process_taxonomies, through: :company_processes

  has_many :industries, dependent: :destroy
  has_many :industry_taxonomies, through: :industries

  has_many :materials, dependent: :destroy
  has_many :materials_taxonomies, through: :materials

  has_many :manufacturers, dependent: :destroy
  has_many :manufacturer_taxonomies, through: :manufacturers

  has_many :machines, dependent: :destroy
  has_many :machines_taxonomies, through: :machines

  has_many_attached :slider_images

  extend FriendlyId
  friendly_id :name, use: :slugged, slug_column: :trimmed_name

  geocoded_by :full_address, latitude: :lat, longitude: :lng
  after_validation :geocode, if: :the_address_changed?

  def full_address
    [location, address].compact.join(', ')
  end

  def the_address_changed?
    address_changed? || location_changed?
  end

  def should_generate_new_friendly_id?
    trimmed_name.blank?
  end

  def all_photos
    arr = []
    attributes.each do |name, value|
      if name =~ /photo\d/
        arr << value if value.present?
      end
    end
    arr
  end
end
