require 'rails_helper'

RSpec.describe SiteController, :type => :controller do

  describe '#index' do
    context 'as a student' do
      before do
        @student = create(:student)
        sign_in(@student)
      end

      it 'redirects to student dashboard' do
        get :index
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(dashboard_path)
      end
    end

    context 'as a staff member' do
      before do
        @staff = create(:staff)
        sign_in(@staff)
      end

      it 'redirects to staff dashboard' do
        get :index
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(staff_path)
      end
    end
  end

end
