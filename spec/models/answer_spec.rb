require 'rails_helper'

RSpec.describe Answer, :type => :model do
  before do
    # @location = create(:location)
    @cohort = create(:cohort)
    @assignment = create(:assignment,
                         cohort: @cohort)
    @student = create(:student, cohort: @cohort)
    # @accepted_answers = create_list(:answer,
    #                                 4,
    #                                 assignment: @assignment,
    #                                 accepted: true)
    # @unaccepted_answers = create_list(:answer,
    #                                   8,
    #                                   assignment: @assignment)
  end

  describe 'associations' do
    it { should have_one :pull_request }
    it { should belong_to :user }
    it { should belong_to :assignment }
  end

  describe 'validates only one answer per user for each assignment' do
    it 'has no errors with single answer' do
      @answer = create(:answer, user: @student)
      expect(@answer.errors.any?).to eq false
    end

    it 'has errors with second answer' do
      @answer1 = create(:answer,
                        user: @student,
                        assignment: @assignment)
      expect(@answer1.errors.any?).to eq false

      @answer2 = build(:answer,
                       user: @student,
                       assignment: @assignment)
      @answer2.valid?
      expect(@answer2.errors.any?).to eq true
    end
  end

  # describe 'validates title and body' do
  #   it { should validate_presence_of :title }
  #   it { should validate_presence_of :body }
  # end
end
