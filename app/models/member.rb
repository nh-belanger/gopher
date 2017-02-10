class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable,
       :omniauthable, :omniauth_providers => [:google_oauth2]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  has_many :timesheets
  has_many :teetimes, through: :timesheets

  has_many :dinings
  has_many :reservations, through: :dinings

  has_many :memberships
  has_many :groups, through: :memberships

  def admin?
    role == "admin"
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    if (User.admins.include?(data.email))
      user = User.find_by(email: data.email)
      if user
        user.provider = access_token.provider
        user.uid = access_token.uid
        user.token = access_token.credentials.token
        user.save
        user
      else
        redirect_to new_user_registration_path, notice: "Error."
      end
    end
  end

end
