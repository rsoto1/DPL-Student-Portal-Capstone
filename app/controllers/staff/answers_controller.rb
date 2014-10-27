class Staff::AnswersController < ApplicationController
  before_action :authenticate_user!

  def update_answer_acceptance
    @answer = Answer.find(params[:answer_id])
    checked = params[:accepted] || false
    @answer.update_attribute(:accepted, checked)
    @anwser.user.add_points(25)
    respond_to do |format|
      format.all { render nothing: true, status: 200 }
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:title,
                                   :body,
                                   :accepted,
                                   :assignment_id,
                                   :user_id,
                                   :answer_id)
  end
end
