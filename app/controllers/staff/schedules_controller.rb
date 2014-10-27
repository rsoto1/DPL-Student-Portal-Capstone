class Staff::SchedulesController < ApplicationController
  include SetCohort
  before_action :authenticate_user!
  before_action :ensure_staff
  before_action :set_cohort
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = @cohort.schedules.all
  end

  def show
  end

  def edit
  end

  def update
    if @schedule.update_attributes(schedule_params)
      redirect_to staff_cohort_schedules_path(@cohort),
                  notice: 'Schedule was successfully updated.'
    else
      render :edit
    end
  end

  def new
    @schedule = @cohort.schedules.new
  end

  def create
    @schedule = @cohort.schedules.new(schedule_params)

    if @schedule.save
      redirect_to staff_cohort_schedules_path(@cohort),
                  notice: 'Schedule was successfully created.'
    else
      render :new
    end
  end

  def destroy
      @schedule.destroy
      redirect_to staff_cohort_schedules_path
  end

  private

  def set_schedule
    @schedule = @cohorts.schedules.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:day, :description, :cohort_id)
  end
end
