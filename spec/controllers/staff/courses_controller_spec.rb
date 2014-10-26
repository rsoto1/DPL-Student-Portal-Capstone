require 'rails_helper'

RSpec.describe Staff::CoursesController, :type => :controller do
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

    it 'assigns the @courses variable' do
      get :index
      expect(assigns(:courses)).to eq(Course.all)
    end
  end

  describe '#show' do
    before do
      @course = create(:course)
    end
    it 'renders info about a course' do
      get :show, id: @course.id
      expect(response).to be_success
      expect(assigns(:course).name).to eq @course.name
      expect(response).to render_template('show')
    end
  end

  describe '#create' do
    before do
      @params = { course: { name: 'Learning Stuff',
                            description: Faker::Lorem.paragraph,
                            duration: 21,
                            duration_unit: 'days' }
                }
    end

    it 'saves the course' do
      expect {
        post :create, @params
      }.to change(Course, :count).by(1)
    end

    # it 'renders new template if unsuccessfull' do
    #   @params = { course: { name: nil }
    #             }
    #   post :create, @params
    #   expect(response).to render_template :new
    # end
  end

  describe '#update' do
    before do
      @course = create(:course)
      @params = { id: @course.id,
                  course: { name: 'Learning Stuff',
                            description: Faker::Lorem.paragraph,
                            duration: 21,
                            duration_unit: 'days' }
                }
    end

    it 'updates the course' do
      patch :update, @params
      assert_response :redirect
      course = Course.find(@course.id)
      expect(course.name).to eq 'Learning Stuff'
      expect(course.duration).to eq 21
      expect(course.duration_unit).to eq 'days'
    end

    # it 'renders edit template if unsuccessfull' do
    #   @params = { id: @course.id,
    #               course: { name: nil }
    #             }
    #   patch :update, @params
    #   expect(response).to render_template :edit
    # end
  end

  describe '#destroy' do
    before do
      @course = create(:course)
      @params = { id: @course.id }
    end

    it 'destroys the course' do
      expect {
        delete :destroy, @params
      }.to change(Course, :count).by(-1)
    end
  end
end
