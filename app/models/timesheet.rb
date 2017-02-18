class Timesheet < ApplicationRecord
  belongs_to :member
  belongs_to :teetime

  validates :member_id, numericality: true
  validates :teetime_id, numericality: true
end
