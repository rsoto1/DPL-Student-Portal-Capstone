require 'rails_helper'

RSpec.describe Assignment, :type => :model do
  describe 'associations' do
    it { should belong_to :cohort }
    it { should have_many :pull_requests }
    it { should have_many :answers }
  end

  describe 'validates name' do
    it { should validate_presence_of :name }
  end

  describe '#accepted_answers' do
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
                                        4,
                                        assignment: @assignment)
    end
    it 'returns 4' do
      expect(@assignment.accepted_answers).to eq 4
    end
  end
end
