class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def to_s
    self.try(:name)
  end
end
