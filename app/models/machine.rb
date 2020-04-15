class Machine < ApplicationRecord
  belongs_to :company
  belongs_to :machines_taxonomy

  def to_s
    machines_taxonomy&.name
  end
end
