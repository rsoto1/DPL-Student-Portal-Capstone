require 'rails_helper'

RSpec.describe Assignment, :type => :model do
  before do
    @location = create(:location)
    @cohort = create(:cohort,
                     location: @location)
    @assignment = create(:assignment,
                         cohort: @cohort)
    @accepted_answers = create_list(:answer,
                                    4,
                                    assignment: @assignment,
                                    accepted: true)
    @unaccepted_answers = create_list(:answer,
                                      8,
                                      assignment: @assignment)
  end

  describe 'associations' do
    it { should belong_to :cohort }
    it { should have_many :pull_requests }
    it { should have_many :answers }
  end

  describe 'validates name' do
    it { should validate_presence_of :name }

    it 'should be invalid if it has no name' do
      @assignment = create(:assignment)
      @assignment.name = nil
      expect(@assignment).to_not be_valid
    end
  end

  describe '#accepted_answers' do
    it 'returns 4' do
      expect(@assignment.answers.count).to eq 12
      expect(@assignment.accepted_answers.count).to eq 4
    end
  end

  describe '#percent_answers_accepted' do
    it 'returns 25.0' do
      @users = create_list(:student, 16, cohort: @cohort)
      expect(@assignment.percent_answers_accepted).to eq 25.0
    end
  end

  describe '#percent_answered' do
    it 'returns 75.0' do
      @users = create_list(:student, 16, cohort: @cohort)
      expect(@assignment.percent_answered).to eq 75.0
    end
  end
end
