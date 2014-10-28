require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do

  describe 'GET about' do
    it 'returns http success' do
      get :about
      expect(response).to have_http_status(:success)
    end

    it 'returns http success for csv' do
      get :about, format: 'csv'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET faq' do
    it 'returns http success' do
      get :faq
      expect(response).to have_http_status(:success)
    end
  end
end
