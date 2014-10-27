class StudentMailer < ActionMailer::Base
  # CHANGE default to app-correct email
  default from: 'staff@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://dpl-student-portal-capstone.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to the Student Portal')
  end
end
