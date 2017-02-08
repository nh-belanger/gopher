class Teetime < ApplicationRecord
  validates :date, presence: true
  validates :time, presence: true
  validates :starting_hole, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 18 }
  # validates :creator_id, presence: true
  # validates :formatted_date, presence: true
  # validates :formatted_time, presence: true

  # has_and_belongs_to_many :members
  has_many :timesheets
  has_many :members, through: :timesheets
end
