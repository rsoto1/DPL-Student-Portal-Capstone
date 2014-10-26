require 'rails_helper'

RSpec.describe Staff::MembersController, :type => :controller do
  before do
    @staff = create(:staff)
    sign_in(@staff)
  end

  describe '#show' do
    before do
      @member = create(:staff,
                       first_name: 'Some',
                       last_name: 'Staff')
    end
    it 'renders info about a staff member' do
      get :show, id: @member.id
      expect(response).to be_success
      expect(@member.first_name).to eq 'Some'
      expect(@member.last_name).to eq 'Staff'
      expect(response).to render_template('show')
    end
  end

  describe '#profile' do
    it 'renders info about a staff member' do
      get :profile
      expect(response).to be_success
      expect(assigns(:member)).to eq(@staff)
      expect(response).to render_template('profile')
    end
  end

  describe '#index' do
    before do
      @members = create_list(:staff, 4)
    end
    it 'renders a list of staff members' do
      get :index
      expect(response).to be_success
      expect(@members.count).to eq 4
      expect(response).to render_template('index')
    end
  end

  describe '#create' do
    before do
      @params = { user: { first_name: 'Staff',
                          last_name: 'Name',
                          email: 'email@mail.com',
                          password: 'password',
                          password_confirmation: 'password',
                          role: :staff
                        }
                }
    end

    it 'saves the staff member' do
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
      @staff = create(:staff)
      @params = { id: @staff.id,
                  user: { first_name: 'Changed',
                          last_name: 'Name'
                        }
                }
    end
    it 'updates the staff member' do
      patch :update, @params
      assert_response :redirect
      user = User.find(@staff.id)
      expect(user.first_name).to eq 'Changed'
      expect(user.last_name).to eq 'Name'
    end
  end

  describe '#destroy' do
    before do
      @staff = create(:staff)
      @params = { id: @staff.id }
    end

    it 'destroys the staff member' do
      expect {
        delete :destroy, @params
      }.to change(User, :count).by(-1)
    end
  end
end
