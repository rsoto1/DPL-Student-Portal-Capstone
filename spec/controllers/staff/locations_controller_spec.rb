require 'rails_helper'

RSpec.describe Staff::LocationsController, :type => :controller do
  render_views
  before do
    @staff = create(:staff)
    sign_in(@staff)
  end

  describe '#index' do
    it 'successfully gets the index page' do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it 'assigns the @locations variable' do
      get :index
      expect(assigns(:locations)).to eq(Location.all)
    end
  end

  describe '#show' do
    before do
      @location = create(:location)
    end
    it 'renders info about a location' do
      get :show, id: @location.id
      expect(response).to be_success
      expect(assigns(:location).name).to eq @location.name
      expect(response).to render_template('show')
    end
  end

  describe '#new' do
    it 'assigns the @location variable' do
      get :new
      expect(assigns(:location)).to be_a_new(Location)
    end
  end

  describe '#create' do
    before do
      @params = { location: { name: 'Somewhere',
                              time_zone_name: Faker::Address.time_zone }
                }
    end

    it 'saves the location' do
      expect {
        post :create, @params
      }.to change(Location, :count).by(1)
    end

    it 'renders new template if unsuccessfull' do
      @params = { location: { name: nil }
                }
      post :create, @params
      expect(response).to render_template :new
    end
  end

  describe '#update' do
    before do
      @location = create(:location)
      @params = { id: @location.id,
                  location: { name: 'Somewhere',
                              time_zone_name: 'Central Time' }
                }
    end

    it 'updates the location' do
      patch :update, @params
      assert_response :redirect
      location = Location.find(@location.id)
      expect(location.name).to eq 'Somewhere'
      expect(location.time_zone_name).to eq 'Central Time'
    end

    it 'renders edit template if unsuccessfull' do
      @params = { id: @location.id,
                  location: { name: nil }
                }
      patch :update, @params
      expect(response).to render_template :edit
    end
  end

  describe '#destroy' do
    before do
      @location = create(:location)
      @params = { id: @location.id }
    end

    it 'destroys the location' do
      expect {
        delete :destroy, @params
      }.to change(Location, :count).by(-1)
    end
  end
end
