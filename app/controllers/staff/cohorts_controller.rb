class Staff::CohortsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cohort, only: [:show, :edit, :update, :destroy]

  def index
    @cohorts = Cohort.all
  end

  def show
  end

  def new
    @cohort = Cohort.new
  end

  def edit
  end

  def update
    if @cohort.update_attributes(cohort_params)
      redirect_to staff_cohort_path, notice: 'Cohort updated!'
    else
      alert_and_render('Could not update', :edit)
    end
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      redirect_to staff_cohort_path(@cohort), notice: 'New cohort added'
    else
      alert_and_render('Could not save cohort', :new)
    end
  end

  def destroy
    @cohort.destroy
    redirect_to staff_cohorts_path, notice: 'Cohort Removed'
  end

  private

  def cohort_params
    params.require(:cohort).permit(:starts_at,
                                   :ends_at,
                                   :name,
                                   :location_id,
                                   :course_id)
  end

  def set_cohort
    @cohort = Cohort.find(params[:id])
  end
end
