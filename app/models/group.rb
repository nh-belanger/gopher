class Group < ApplicationRecord
  validates :name, presence: true

  has_many :memberships
  has_many :members, through: :memberships

  has_many :grouprequests
end
