class BlogCategory < ApplicationRecord
  has_many :blog_tags, dependent: :destroy
end
