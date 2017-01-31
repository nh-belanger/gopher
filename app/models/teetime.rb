class Teetime < ApplicationRecord
  validates :date, presence: true
  validates :time, presence: true
  validates :starting_hole, presence: true


  has_and_belongs_to_many :members
#   has_many :members_teetimes
#   has_many :members, through: :members_teetimes
end
