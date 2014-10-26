require 'rails_helper'

RSpec.describe Staff::CohortsController, :type => :controller do
  render_views
  before do
    @location = create(:location)
    @staff = create(:staff)
    sign_in(@staff)
  end

  describe '#index' do
    it 'successfully gets the index page' do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it 'assigns the @cohorts variable' do
      get :index
      expect(assigns(:cohorts)).to eq(@location.cohorts.all)
    end
  end

  describe '#show' do
    before do
      @cohort = create(:cohort,
                       location: @location)
    end
    it 'renders info about a cohort' do
      get :show, id: @cohort.id
      expect(response).to be_success
      expect(assigns(:cohort).name).to eq @cohort.name
      expect(response).to render_template('show')
    end
  end

  describe '#create' do
    before do
      @params = { cohort: { name: 'Cohort 2048',
                            starts_at: Time.now,
                            ends_at: Time.now + 11.weeks },
                  location: @location
                }
    end

    it 'saves the cohort' do
      expect {
        post :create, @params
      }.to change(Cohort, :count).by(1)
    end
  end

  describe '#update' do
    before do
      @cohort = create(:cohort)
      @params = { id: @cohort.id,
                  cohort: { name: 'Cohort 2222',
                            starts_at: Time.now,
                            ends_at: Time.now + 11.weeks }
                }
    end

    it 'updates the cohort' do
      cohort = Cohort.find(@cohort.id)
      expect(cohort.name).to eq 'Cohort 4096'
      patch :update, @params
      assert_response :redirect
      cohort = Cohort.find(@cohort.id)
      expect(cohort.name).to eq 'Cohort 2222'
    end
  end

  describe '#destroy' do
    before do
      @cohort = create(:cohort)
      @params = { id: @cohort.id }
    end

    it 'destroys the cohort' do
      expect {
        delete :destroy, @params
      }.to change(Cohort, :count).by(-1)
    end
  end
end
