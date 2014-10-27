require 'rails_helper'

RSpec.describe Staff::UsersController, :type => :controller do

  before do
    @location = create(:location)
    @cohort = create(:cohort, location: @location)
    @staff = create(:staff)
    sign_in(@staff)
  end

  describe '#show' do
    before do
      @student = create(:student,
                        first_name: 'Some',
                        last_name: 'Student',
                        cohort: @cohort)
    end
    it 'renders info about a student' do
      get :show, id: @student.id, cohort_id: @cohort.id
      expect(response).to be_success
      expect(assigns(:student).first_name).to eq 'Some'
      expect(assigns(:student).last_name).to eq 'Student'
      expect(response).to render_template('show')
    end
  end

  describe '#create' do
    before do
      @params = { user: { first_name: 'Student',
                          last_name: 'Name',
                          email: 'email@mail.com',
                          password: 'password',
                          password_confirmation: 'password',
                          role: :student },
                  location_id: @location.id,
                  cohort_id: @cohort.id }
    end

    it 'saves the student' do
      expect {
        post :create, @params
      }.to change(User, :count).by(1)
    end

    it 'sends an email' do
      expect {
        post :create, @params
      }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end

  describe '#update' do
    before do
      @student = create(:student, cohort: @cohort)
      @params = { id: @student.id,
                  location_id: @location.id,
                  cohort_id: @cohort.id,
                  user: { first_name: 'Changed',
                          last_name: 'Name' }
                }
    end
    it 'updates the student' do
      patch :update, @params
      assert_response :redirect
      user = User.find(@student.id)
      expect(user.first_name).to eq 'Changed'
      expect(user.last_name).to eq 'Name'
    end
  end

  describe '#destroy' do
    before do
      @student = create(:student, cohort: @cohort)
      @params = { id: @student.id,
                  location_id: @location.id,
                  cohort_id: @cohort.id }
    end

    it 'destroys the student' do
      expect {
        delete :destroy, @params
      }.to change(User, :count).by(-1)
    end
  end
end
