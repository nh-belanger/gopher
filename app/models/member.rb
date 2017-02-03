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

  def admin?
    role == "admin"
  end

  def self.find_for_google_oauth2(auth)
  data = auth.info
  if validate_email(auth)
    member = Member.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      member.provider = auth.provider
      member.uid = auth.uid
      member.email = auth.info.email
      member.password = Devise.friendly_token[0,20]
    end
    member.token = auth.credentials.token
    member.refresh_token = auth.credentials.refresh_token
    member.save
    return member
  else
    return nil
  end
end

end
