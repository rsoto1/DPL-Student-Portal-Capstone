require 'rails_helper'

RSpec.describe Staff::AssignmentsController, :type => :controller do
  render_views
  before do
    @location = create(:location)
    @cohort = create(:cohort, location: @location)
    @staff = create(:staff)
    sign_in(@staff)
  end

  describe '#index' do
    it 'successfully gets the index page' do
      get :index, cohort_id: @cohort.id
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it 'assigns the @assignments variable' do
      get :index, cohort_id: @cohort.id
      expect(assigns(:assignments)).to eq(@cohort.assignments.order(:due_date))
    end
  end

  describe '#show' do
    before do
      @assignment = create(:assignment,
                           name: 'Some Assignment',
                           category: 'Ruby',
                           cohort: @cohort)
    end
    
    it 'renders info about an assignment' do
      get :show, id: @assignment.id, cohort_id: @cohort.id
      expect(response).to be_success
      expect(assigns(:assignment).name).to eq 'Some Assignment'
      expect(assigns(:assignment).category).to eq 'Ruby'
      expect(response).to render_template(:show)
    end
  end

  describe '#new' do
    it 'assigns the @assignment variable' do
      get :new, cohort_id: @cohort.id
      expect(assigns(:assignment)).to be_a_new(Assignment)
    end
  end

  describe '#create' do
    before do
      @params = { assignment: { name: 'Some Assignment',
                                category: 'Ruby',
                                description: Faker::Lorem.paragraph,
                                due_date: Time.now + 1.day
                              },
                  cohort_id: @cohort.id
                }
    end

    it 'saves the assignment' do
      expect {
        post :create, @params
      }.to change(Assignment, :count).by(1)
    end

    it 'renders new template if unsuccessfull' do
      @params = { assignment: { name: nil },
                  cohort_id: @cohort.id
                }
      post :create, @params
      expect(response).to render_template :new
    end
  end

  describe '#update' do
    before do
      @assignment = create(:assignment, cohort: @cohort)
      @params = { id: @assignment.id,
                  cohort_id: @cohort.id,
                  assignment: { name: 'Changed Assignment',
                                category: 'javascript' }
                }
    end

    it 'updates the assignment' do
      patch :update, @params
      assert_response :redirect
      assignment = Assignment.find(@assignment.id)
      expect(assignment.name).to eq 'Changed Assignment'
      expect(assignment.category).to eq 'javascript'
    end

    it 'renders edit template if unsuccessfull' do
      @params = { id: @assignment.id,
                  cohort_id: @cohort.id,
                  assignment: { name: nil }
                }
      patch :update, @params
      expect(response).to render_template :edit
    end
  end

  describe '#destroy' do
    before do
      @assignment = create(:assignment, cohort: @cohort)
      @params = { id: @assignment.id,
                  cohort_id: @cohort.id }
    end

    it 'destroys the assignment' do
      expect {
        delete :destroy, @params
      }.to change(Assignment, :count).by(-1)
    end
  end
end
