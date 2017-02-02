class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  has_many :timesheets
  has_many :teetimes, through: :timesheets

  has_many :dinings
  has_many :reservations, through: :dinings
  # has_and_belongs_to_many :teetimes
end
