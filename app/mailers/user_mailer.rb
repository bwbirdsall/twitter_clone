class UserMailer < ActionMailer::Base
  default from: "hello@pseudotwitter.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #

  def signup_confirmation(user)
    @user = user
    @greeting = "Hi"

    mail to: @user.email, subject: "Hello new friend!"
  end

  def mention_email(user, tweet)
    @user = user
    @tweet = tweet

    mail to: @user.email, subject: "Look who's popular!"
  end
end
