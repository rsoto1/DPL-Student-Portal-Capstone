require 'rails_helper'

RSpec.describe Dashboard::BaseController, :type => :controller do
  before do
    @location = create(:location)
    @cohort = create(:cohort, location: @location)
    @student = create(:student, cohort: @cohort)
    sign_in(@student)
  end

  describe 'GET index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns the @assignments variable' do
      get :index
      expect(assigns(:assignments)).to eq(@cohort.assignments.all)
    end
  end

end
