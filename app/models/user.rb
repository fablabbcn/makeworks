class User < ApplicationRecord
  has_many :user_regions
  has_many :regions, through: :user_regions
end
