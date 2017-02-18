class Reservation < ApplicationRecord
  validates :date, presence: true
  validates :time, presence: true
  validates :party_size, numericality: { greater_than: 0 }
  validates :room, presence: true
  # has_and_belongs_to_many :members
  has_many :dinings
  has_many :members, through: :dinings
end
