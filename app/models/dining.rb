class Dining < ApplicationRecord
  belongs_to :member
  belongs_to :reservation

  validates :member_id, numericality: true
  validates :reservation_id, numericality: true
end
