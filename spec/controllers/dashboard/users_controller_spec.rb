require 'rails_helper'

RSpec.describe Dashboard::UsersController, :type => :controller do
  before do
    @location = create(:location)
    @cohort = create(:cohort, location: @location)
    @student = create(:student)
    sign_in(@student)
  end

  describe '#profile' do
    it 'renders info about a student' do
      get :profile
      expect(response).to be_success
      expect(assigns(:user)).to eq(@student)
      expect(response).to render_template('profile')
    end
  end

  # describe '#update' do
  #   before do
  #     @student = create(:student, cohort: @cohort)
  #     @params = { id: @student.id,
  #                 cohort_id: @cohort.id,
  #                 user: { first_name: 'Changed',
  #                         last_name: 'Name' }
  #               }
  #   end
  #   it 'updates the student' do
  #     @student.update_info(@params)
  #     assert_response :redirect
  #     user = User.find(@student.id)
  #     expect(user.first_name).to eq 'Changed'
  #     expect(user.last_name).to eq 'Name'
  #   end
  # end
end
