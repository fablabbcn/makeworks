class Employee < ApplicationRecord
  belongs_to :user
  belongs_to :company

  before_create :set_default_role

  acts_as_list scope: :company

  enum role: {
    owner: 0,
    manager: 1,
    normal: 2
  }

  def to_s
    title
  end

  private

  def set_default_role
    self.role ||= 2
  end
end
