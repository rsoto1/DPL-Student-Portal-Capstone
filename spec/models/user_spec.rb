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

  describe '.build_with_temp_password' do
    it 'should build a new student' do
      @student = User.build_with_temp_password(role: :student)
      expect(@student).to be_student
    end

    it 'should build a new student' do
      @staff = User.build_with_temp_password(role: :staff)
      expect(@staff).to be_staff
    end
  end

  describe 'update_info' do
    it 'should update the user info' do
      student.update_info(first_name: 'Bill',
                          last_name: 'Ted')
      expect(student.first_name).to eq 'Bill'
      expect(student.last_name).to eq 'Ted'
      expect(student.temp_password).to be_nil
    end
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
        expect(student.cohort).to_not be_nil
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
