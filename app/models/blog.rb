class Blog < ApplicationRecord
  belongs_to :blog_category, optional: true, class_name: 'BlogCategory'
  belongs_to :medium, optional: true
end
