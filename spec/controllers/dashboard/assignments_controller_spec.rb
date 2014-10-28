require 'rails_helper'

RSpec.describe Dashboard::AssignmentsController, :type => :controller do
  before do
    @location = create(:location)
    @cohort = create(:cohort, location: @location)
    @student = create(:student, cohort: @cohort)
    sign_in(@student)
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
end
