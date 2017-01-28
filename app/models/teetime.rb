class TeeTime < ApplicationRecord
  validates :date, presence: true, numericality: {only_integer: true,
  validates :time, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2400
  validates :starting_hole, presence: true, numericality: true

  has_many :member_teetimes
  has_many :members, through: :member_teetimes
end
