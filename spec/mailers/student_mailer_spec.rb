require "rails_helper"

RSpec.describe StudentMailer, :type => :mailer do
  describe 'welcome_email' do
    let(:user) { create :student }
    let(:mail) { StudentMailer.welcome_email(user) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Welcome to the Student Portal')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['staff@example.com'])
    end

    it 'assigns @url' do
      expect(mail.body.encoded).to match('http://dpl-student-portal-capstone.herokuapp.com')
    end

    it "includes user's temp password" do
      expect(mail.body.encoded).to match(user.temp_password)
    end
  end
end
