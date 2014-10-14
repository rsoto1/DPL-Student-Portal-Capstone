class Dashboard::AssignmentsController < ApplicationController
  include SetCohort
  before_action :authenticate_user!
  before_action :set_cohort

  def index
    @assignments = @cohort.assignments.order(:due_date)
  end

  def show
    @assignment = @cohort.assignments.includes(:answers).find(params[:id])
  end

  private

  # def set_cohort
  #   @cohort = current_user.cohort
  # end

  # def set_assignment
  #   @assignment = @cohort.assignments.find(params[:id])
  # end

  def assignment_params
    params.require(:assignment).permit(:name,
                                       :description,
                                       :category,
                                       :due_date,
                                       :cohort_id)
  end
end
