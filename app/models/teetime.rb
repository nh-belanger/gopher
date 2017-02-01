class Teetime < ApplicationRecord
  validates :date, presence: true
  validates :time, presence: true
  validates :starting_hole, presence: true


  # has_and_belongs_to_many :members
  has_many :timesheets
  has_many :members, through: :timesheets
end
