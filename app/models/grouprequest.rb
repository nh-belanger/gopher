class Grouprequest < ApplicationRecord
  validates :member_id, null: false
  validates :group_id, null: false

  belongs_to :member
end
