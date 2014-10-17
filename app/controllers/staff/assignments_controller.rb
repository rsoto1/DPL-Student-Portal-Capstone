class Staff::AssignmentsController < ApplicationController
  include SetCohort
  before_action :authenticate_user!
  before_action :ensure_staff
  before_action :set_cohort
  before_action :set_assignment, only: [:edit, :update, :destroy]

  def index
    @assignments = @cohort.assignments.order(:due_date)
  end

  def show
    @assignment = @cohort.assignments.includes(:answers).includes(:pull_requests).find(params[:id])
  end

  def edit
  end

  def update
    if @assignment.update(assignment_params)
      redirect_to staff_cohort_assignments_url,
                  notice: 'Assignment was successfully updated.'
    else
      render :edit
    end
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = @cohort.assignments.build(assignment_params)

    if @assignment.save
      redirect_to staff_cohort_assignments_url,
                  notice: 'Assignment was successfully created.'
    else
      render :new
    end
  end

  def destroy
    begin
      @assignment.destroy
      flash[:notice] = 'Assignment deleted!'
    rescue StandardError => error
      flash[:notice] = error.message
    end
    redirect_to staff_cohort_assignments_url
  end

  private

  def set_assignment
    @assignment = @cohort.assignments.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:name,
                                       :description,
                                       :category,
                                       :due_date,
                                       :cohort_id)
  end
end
