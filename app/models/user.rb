class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Discard::Model
  default_scope { kept }

  devise :database_authenticatable, :registerable,
         :invitable, :confirmable,
         :recoverable, :rememberable, :validatable,
         :trackable,
         :omniauthable,
         omniauth_providers: [:fablabs, :linkedin, :google_oauth2]

  has_many :employees, dependent: :destroy
  has_many :companies, through: :employees

  has_many :user_regions, dependent: :destroy
  has_many :regions, through: :user_regions

  has_many :blogs

  # Only shows where is_favorites: true - not if the company has a note
  # If we use notes, we have to decide if they are always shown or not
  # Company can be unfavorited - does that also remove the note? Is that company still shown?
  # See: https://github.com/fablabbcn/makeworks/issues/21
  has_many :favorite_companies, -> { where(is_favorite: true) }

  extend FriendlyId
  friendly_id :first_name, use: [:slugged, :finders]

  has_one_attached :avatar
  has_rich_text :bio

  # The /users.json endpoint is using Ransack.
  # Only allow to search for name, not email.
  def self.ransackable_attributes(auth_object = nil)
    if auth_object == :api
      super & %w(first_name last_name slug)
    else
      super
    end
  end

  def to_s
    name
  end

  paginates_per 10

  def name
    # Be careful to not show other users email addresses. Instead we show ID if no name present.
    if "#{first_name} #{last_name}".length > 1
      "#{first_name} #{last_name}"
    else
      "ID: #{id}"
    end
  end

  def name_and_email
    "#{name} - #{email}"
  end

  def self.from_omniauth(auth)
    # Should we care which provider / uid is used?
    # user = User.where(provider: auth.provider, uid: auth.uid).first

    user_found = User.where(email: auth.info.email).first
    return user_found if user_found.present?

    # TODO: Should we create a new user if email not found?
    # Example: User using 2 different emails:
    # User has an account on Fablabs.io but uses another email on MakeWorks
    # user1@test.com is the email used on Fablabs.io
    # user1@else.com is the email used on MakeWorks
    # User uses 'Log in with Fablabs.io' -> New account will be created

    # Create new user if email not found
    User.create! do |user|
      user.password = Devise.friendly_token[0,20]
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
    end
  end

  def in_region(region_id)
    UserRegion.where(user: self, region: region_id).present?
  end

  def is_champion_in_regions(region_ids)
    # Example: A company can be a part of 3 regions.
    # For every region in region_ids
    # Check if the user is champion in ANY of them.
    user_regions.where(region: region_ids).pluck(:is_champion).include?(true)
  end

  def is_champion_in_region(region_id)
    user_regions.where(region: region_id).first&.is_champion
  end

  def is_employee_in_company(company_id)
    employees.where(company: company_id).first
  end
end
