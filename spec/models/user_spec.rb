require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:student) { FactoryGirl.create :student }
  let(:staff) { FactoryGirl.create :staff }

  describe 'associations' do
    it { should belong_to :cohort }
    it { should have_one :github_profile }
    it { should have_many :answers }
    it { should have_many :pull_requests }
  end

  context 'as a student' do
    describe '.student?' do
      it 'should be a student' do
        expect(student.student?).to eq true
      end
    end

    describe '.staff?' do
      it 'should not be a staff member' do
        expect(student.staff?).to_not eq true
      end
    end

    describe '.cohort' do
      it 'should be in a cohort' do
        expect(student.cohort).to_not eq nil
      end
    end

    describe '.pull_requests' do
      it 'should have many pull requests' do
        create_list(:pull_request, 4, user: student)

        expect(student.pull_requests.count).to eq 4
      end
    end
  end

  context 'as a staff member' do
    describe '.staff?' do
      it 'should be a staff member' do
        expect(staff.staff?).to eq true
      end
    end

    describe '.student?' do
      it 'should not be a student' do
        expect(staff.student?).to_not eq true
      end
    end
  end
end
