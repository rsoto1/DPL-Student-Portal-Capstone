class Dashboard::AnswersController < ApplicationController
  include SetCohort
  before_action :authenticate_user!
  before_action :set_cohort, :set_assignment
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  
  def index
   @answers = @assignment.answers.order(:accepted)
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to dashboard_assignment_url(@assignment),
                                  notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = @assignment.answers.build(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to dashboard_assignment_url(@assignment),
                                  notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    begin
      @answer.destroy
      flash[:notice] = 'Answer deleted!'
    rescue StandardError => e
      flash[:notice] = e.message
    end
    respond_to do |format|
      format.html { redirect_to dashboard_assignments_url }
      format.json { head :no_content }
    end
  end

  private

  def set_answer
    @answer = @assignment.answers.find(params[:id])
  end

  def set_assignment
    @assignment = @cohort.assignments.find(params[:assignment_id])
  end

  def answer_params
    params.require(:answer).permit(:title,
                                   :body,
                                   :accepted,
                                   :assignment_id,
                                   :user_id)
  end

end
