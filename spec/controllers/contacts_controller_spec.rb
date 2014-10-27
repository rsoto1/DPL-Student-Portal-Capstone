require 'rails_helper'

RSpec.describe ContactsController, :type => :controller do
  before do
    @location = create(:location)
    @cohort = create(:cohort, location: @location)
    @student = create(:student, cohort: @cohort)
    sign_in(@student)
  end

  describe '#new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'assigns the @contact variable' do
      get :new
      expect(assigns(:contact)).to be_a(Contact)
    end
  end

  describe '#create' do
    before do
      @params = { contact: { name: 'Peter Griffin',
                             email: 'email@mail.com',
                             message: Faker::Lorem.paragraph,
                             nickname: ''
                           }
                }
    end

    it 'sends an email' do
      expect {
        post :create, @params
      }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it 'redirects to the root path' do
      post :create, @params
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
    end
  end
end
