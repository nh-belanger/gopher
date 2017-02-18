class Teetimerequest < ApplicationRecord
  validates :member_id, numericality: true
  validates :teetime_id, numericality: true

  belongs_to :member
end
