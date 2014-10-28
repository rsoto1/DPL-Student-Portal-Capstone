require 'rails_helper'

RSpec.describe Staff::AnswersController, :type => :controller do
  # render_views
  # before do
  #   @location = create(:location)
  #   @cohort = create(:cohort, location: @location)
  #   @assignment = create(:assignment, cohort: @cohort)
  #   @answer = create(:answer, assignment: @assignment)
  #   @staff = create(:staff)
  #   sign_in(@staff)
  # end

  # describe '#update_answer_acceptance' do
  #   before do
  #     @params = { id: @answer.id,
  #                 cohort_id: @cohort.id,
  #                 assignment_id: @assignment.id,
  #                 answer: { answer_id: @answer.id,
  #                           accepted: true
  #                         },
  #                 format: :json
  #               }
  #   end

  #   it 'has a 200 status code' do
  #     xhr :post, :update_answer_acceptance, @params

  #     expect(response.status).to eq(200)
  #     expect(response).to be_success
  #   end
  # end
end
