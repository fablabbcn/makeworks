class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:fablabs, :linkedin]
  has_many :user_regions, dependent: :destroy
  has_many :regions, through: :user_regions

  extend FriendlyId
  friendly_id :first_name, use: :slugged

  has_one_attached :avatar

  def to_s
    name
  end

  def name
    if "#{first_name} #{last_name}".length > 1
      "#{first_name} #{last_name}"
    else
      email
    end
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

  def is_champion_in_region(region_id)
    UserRegion.where(user: self, region: region_id).first&.is_champion
  end

end
