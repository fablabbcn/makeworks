class Blog < ApplicationRecord
  belongs_to :blog_category, optional: true
  belongs_to :medium, optional: true
end
