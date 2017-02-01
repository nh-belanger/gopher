class Timesheet < ApplicationRecord
  belongs_to :member
  belongs_to :teetime
end
