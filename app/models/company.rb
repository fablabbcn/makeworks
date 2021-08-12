class Company < ApplicationRecord
  belongs_to :user, optional: true # The user who created /submitted the company

  has_many :employees, dependent: :destroy
  has_many :users, through: :employees

  has_many :company_organization, dependent: :destroy
  has_many :regions, through: :company_organization

  has_many :company_production_accesses, dependent: :destroy
  has_many :production_accesses, through: :company_production_accesses

  has_many :finished_products, dependent: :destroy
  has_many :finished_products_taxonomies, through: :finished_products

  has_many :company_processes, dependent: :destroy
  has_many :process_taxonomies, through: :company_processes

  has_many :industries, dependent: :destroy
  has_many :industry_taxonomies, through: :industries

  has_many :material_tags, dependent: :destroy
  has_many :materials, through: :material_tags

  has_many :manufacturers, dependent: :destroy
  has_many :manufacturer_taxonomies, through: :manufacturers

  has_many :machines, dependent: :destroy
  has_many :machines_taxonomies, through: :machines

  #has_one_attached :contact_avatar
  has_many_attached :slider_images

  paginates_per 12

  validates :slug, uniqueness: true
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  geocoded_by :full_address, latitude: :lat, longitude: :lng
  after_validation :geocode, if: :the_address_changed?

  # Soft delete is a flag inherited from the the old website.
  scope :soft_deleted, -> { where(soft_delete: true) }
  scope :not_soft_deleted, -> { where(soft_delete: [false, nil]) }
  scope :verified, -> { where(is_verified: true) }
  scope :unverified, -> { where(is_verified: [false, nil]) }

  # Show companies without a region
  # If company is a part of 2 regions, and one region is hidden, it should still show.
  def self.region_public_or_empty
    where(regions: { is_public: true }).or(where(regions: nil))
  end

  def full_address
    [location, address].compact.join(', ')
  end

  def the_address_changed?
    address_changed? || location_changed?
  end

  def country
    ISO3166::Country[country_code]
  end

  def should_generate_new_friendly_id?
    slug.blank?
  end

  def old_photos
    arr = []
    attributes.each do |name, value|
      if name =~ /photo\d/
        arr << value if value.present?
      end
    end
    arr
  end
end
