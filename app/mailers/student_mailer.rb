class StudentMailer < ActionMailer::Base
  # CHANGE default to app-correct email
  default from: 'notifications@example.com'
 
  def welcome_email(student)
    @student = student
    @url  = http://dpl-student-portal-capstone.herokuapp.com
    mail(to: @student.email, subject: 'Welcome to the Student Portal')
  end
end