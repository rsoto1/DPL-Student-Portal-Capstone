class Staff::AssignmentsController < ApplicationController
  include SetCohort
  before_action :authenticate_user!
  before_action :ensure_staff!, only: [:new, :create]
  before_action :set_cohort
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  
  def index
   @assignments = @cohort.assignments..order(:due_date)
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to assignments_url, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
  end

  def create
    @assignment = @cohort.assignment.build(assignment_params)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to assignments_url, notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    begin
      @assignment.destroy
      flash[:notice] = 'Assignment deleted!'
    rescue StandardError => e
      flash[:notice] = e.message
    end
    respond_to do |format|
      format.html { redirect_to assignments_url }
      format.json { head :no_content }
    end
  end

  private

  def set_assignment
    @assignment = @cohort.assignments.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:name,
                                       :description,
                                       :type,
                                       :due_date,
                                       :cohort_id)
  end
end
