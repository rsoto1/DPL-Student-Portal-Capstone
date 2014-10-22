require 'rails_helper'

RSpec.describe Answer, :type => :model do
  describe 'associations' do
    it { should have_one :pull_request }
    it { should belong_to :user }
    it { should belong_to :assignment }
  end

  # not working at the moment. need to build an assignment to test against
  # describe 'validates only one answer per user for each assignment' do
  #   it { should validate :users_only_answer }
  # end

  # describe 'validates title and body' do
  #   it { should validate_presence_of :title }
  #   it { should validate_presence_of :body }
  # end
end
