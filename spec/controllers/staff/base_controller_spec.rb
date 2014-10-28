require 'rails_helper'

RSpec.describe Staff::BaseController, :type => :controller do
  before do
    @location = create(:location)
    @cohort = create(:cohort, location: @location)
    @staff = create(:staff)
    sign_in(@staff)
  end

  describe '#index' do
    before do
      create_list(:cohort, 4, location: @location)
    end

    it 'successfully gets the index page' do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it 'assigns the @cohorts variable' do
      get :index
      expect(assigns(:cohorts)).to eq(Cohort.all)
    end
  end

  describe '#admin' do
    it 'successfully gets the admin page' do
      get :admin
      expect(response).to be_success
      expect(response).to render_template(:admin)
    end

    it 'assigns the @locations variable' do
      get :admin
      expect(assigns(:locations)).to eq(Location.all)
    end

    it 'assigns the @courses variable' do
      get :admin
      expect(assigns(:courses)).to eq(Course.all)
    end

    it 'assigns the @members variable' do
      get :admin
      expect(assigns(:members)).to eq(User.staff.all)
    end

    it 'should assing a new location instance to @location' do
      get :admin
      expect(assigns(:location)).to be_a(Location)
    end

    it 'should assing a new course instance to @course' do
      get :admin
      expect(assigns(:course)).to be_a(Course)
    end

    it 'should assing a new staff member instance to @member' do
      get :admin
      expect(assigns(:member)).to be_a(User)
      expect(assigns(:member).staff?).to eq(true)
    end
  end
end
