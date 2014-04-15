class User < ActiveRecord::Base
  has_many :tweets
  validates :handle, format: { with: /\A\w+\z/,
    message: "only allows letters, numbers, and underscores" }
  after_create :send_signup_confirmation

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def send_signup_confirmation
    UserMailer.signup_confirmation(self).deliver
  end

  def send_mention_email(tweeter)
    UserMailer.mention_email(self, tweeter).deliver
  end
end
