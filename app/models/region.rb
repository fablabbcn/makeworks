class Region < ApplicationRecord
  has_many :user_regions
  has_many :users, through: :user_regions
  has_many :companies
end
