class Reservationrequest < ApplicationRecord
  validates :member_id, numericality: true
  validates :reservation_id, numericality: true
  belongs_to :member
end
