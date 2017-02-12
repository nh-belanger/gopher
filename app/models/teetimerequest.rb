class Teetimerequest < ApplicationRecord
  validates :member_id, null: false
  validates :teetime_id, null: false

  belongs_to :member
end
