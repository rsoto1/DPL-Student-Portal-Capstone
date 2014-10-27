class Staff::SchedulesController < ApplicationController
  # include SetCohort
  before_action :authenticate_user!
  before_action :ensure_staff
  # before_action :set_cohort
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.all
  end

  def show
   if @schedule
      @schedule = Schedule.new
    end
  end

  def edit
  end

  def update
    if @schedule.update_attributes(schedule_params)
      redirect_to staff_schedules_path,
                  notice: 'Schedule was successfully updated.'
    else
      render :edit
    end
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)

    if @schedule.save
      redirect_to staff_schedules_path,
                  notice: 'Schedule was successfully created.'
    else
      render :new
    end
  end

  def destroy
      @schedule.destroy
      redirect_to staff_schedules_path
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:day, :description)
  end
end
