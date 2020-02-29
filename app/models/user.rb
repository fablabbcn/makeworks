class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_regions, dependent: :destroy
  has_many :regions, through: :user_regions

  def to_s
    name
  end

  def name
    "#{first_name} #{last_name}"
  end

  def is_champion_in_region(region_id)
    UserRegion.where(user: self, region: region_id).first.is_champion
  end

end
