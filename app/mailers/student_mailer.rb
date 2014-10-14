class StudentMailer < ActionMailer::Base
  # CHANGE default to app-correct email
  default from: 'notifications@example.com'
 
  def welcome_email(student)
    @student = student
    # CHANGE @url to correct login page
    # @url  = 'http://example.com/login'
    mail(to: @student.email, subject: 'Welcome to the Student Portal')
  end
end