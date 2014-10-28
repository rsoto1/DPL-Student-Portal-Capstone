require 'rails_helper'

RSpec.describe Staff::SchedulesController, :type => :controller do
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

    it 'assigns the @schedules variable' do
      get :index, cohort_id: @cohort.id
      expect(assigns(:schedules)).to eq(@cohort.schedules.all)
    end
  end

  describe '#show' do
    before do
      @schedule = create(:schedule,
                         cohort: @cohort)
    end
    it 'renders info about a schedule' do
      get :show, id: @schedule.id, cohort_id: @cohort.id
      expect(response).to be_success
      expect(assigns(:schedule).day).to eq @schedule.day
      expect(assigns(:schedule).description).to eq @schedule.description
      expect(response).to render_template('show')
    end
  end

  describe '#create' do
    before do
      @params = { schedule: { day: 'Thursday',
                              description: 'Something is scheduled'
                            },
                  cohort_id: @cohort.id
                }
    end

    it 'saves the schedule' do
      expect {
        post :create, @params
      }.to change(Schedule, :count).by(1)
    end

    it 'renders new template if unsuccessfull' do
      @params = { schedule: { day: nil,
                              description: 'Something is scheduled'
                            },
                  cohort_id: @cohort.id
                }
      post :create, @params
      expect(response).to render_template :new
    end
  end

  describe '#update' do
    before do
      @schedule = create(:schedule, cohort: @cohort)
      @params = { id: @schedule.id,
                  cohort_id: @cohort.id,
                  schedule: { day: 'Thursday',
                              description: 'Do Stuff'
                            }
                }
    end

    it 'updates the schedule' do
      patch :update, @params
      assert_response :redirect
      schedule = Schedule.find(@schedule.id)
      expect(schedule.day).to eq 'Thursday'
      expect(schedule.description).to eq 'Do Stuff'
    end

    it 'renders edit template if unsuccessfull' do
      @params = { id: @schedule.id,
                  cohort_id: @cohort.id,
                  schedule: { day: nil,
                              description: 'Something is scheduled'
                            }
                }
      patch :update, @params
      expect(response).to render_template :edit
    end
  end

  describe '#destroy' do
    before do
      @schedule = create(:schedule, cohort: @cohort)
      @params = { id: @schedule.id,
                  cohort_id: @cohort.id }
    end

    it 'destroys the schedule' do
      expect {
        delete :destroy, @params
      }.to change(Schedule, :count).by(-1)
    end
  end
end
