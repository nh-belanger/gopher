class Reservation < ApplicationRecord
  validates :date, presence: true
  validates :time, presence: true
  validates :party_size, presence: true

  # has_and_belongs_to_many :members
  has_many :dinings
  has_many :members, through: :dinings
end
