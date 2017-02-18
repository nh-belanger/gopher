class Grouprequest < ApplicationRecord
  validates :member_id, numericality: true
  validates :group_id, numericality: true

  belongs_to :member
end
