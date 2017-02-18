class Membership < ApplicationRecord
  belongs_to :member
  belongs_to :group

  validates :member_id, numericality: true
  validates :group_id, numericality: true
end
