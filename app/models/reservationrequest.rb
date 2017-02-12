class Reservationrequest < ApplicationRecord
  validates :member_id, null: false
  validates :reservation_id, null: false

  belongs_to :member
end
