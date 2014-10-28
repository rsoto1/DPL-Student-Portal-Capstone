require 'rails_helper'

RSpec.describe Dashboard::AnswersController, :type => :controller do
  before do
    @location = create(:location)
    @cohort = create(:cohort, location: @location)
    @assignment = create(:assignment, cohort: @cohort)
    @student = create(:student, cohort: @cohort)
    sign_in(@student)
  end
  
  describe '#new' do
    it 'assigns the @answer variable' do
      get :new, assignment_id: @assignment.id
      expect(assigns(:answer)).to be_a_new(Answer)
    end
  end

  describe '#update' do
    before do
      @answer = create(:answer, assignment: @assignment)
      @params = { id: @answer.id,
                  assignment_id: @assignment.id,
                  answer: { title: 'Changed Answer',
                            body: 'javascript' }
                }
    end

    it 'updates the answer' do
      patch :update, @params
      assert_response :redirect
      answer = Answer.find(@answer.id)
      expect(answer.title).to eq 'Changed Answer'
      expect(answer.body).to eq 'javascript'
    end

    it 'renders edit template if unsuccessfull' do
      @params = { id: @answer.id,
                  assignment_id: @assignment.id,
                  answer: { title: nil }
                }
      patch :update, @params
      expect(response).to render_template :edit
    end
  end

  describe '#destroy' do
    before do
      @answer = create(:answer, assignment: @assignment)
      @params = { id: @answer.id,
                  assignment_id: @assignment.id }
    end

    it 'destroys the assignment' do
      expect {
        delete :destroy, @params
      }.to change(Answer, :count).by(-1)
    end
  end
end
