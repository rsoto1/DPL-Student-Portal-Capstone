class StudentMailer < ActionMailer::Base
  # CHANGE default to app-correct email
  default from: 'staff@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://beakr2.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to Beakr 2.0')
  end
end
