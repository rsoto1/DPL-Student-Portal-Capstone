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
    @answer.user = current_user
    if @answer.update(answer_params)
      redirect_to dashboard_assignment_url(@assignment),
                  notice: 'Answer was successfully updated.'
    else
      render :edit
    end
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = @assignment.answers.build(answer_params)
    @answer.user = current_user
    if @answer.save
      current_user.add_points(25, category: 'Assignments')
      redirect_to dashboard_assignment_url(@assignment),
                  notice: 'Assignment was successfully created.'
    else
      render :new
    end
  end

  def destroy
    begin
      @answer.destroy
      flash[:notice] = 'Answer deleted!'
    rescue StandardError => error
      flash[:notice] = error.message
    end
    redirect_to dashboard_assignments_url
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
