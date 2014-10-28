require 'rails_helper'

RSpec.describe Dashboard::TodosController, :type => :controller do
  render_views
  before do
    @location = create(:location)
    @cohort = create(:cohort, location: @location)
    @student = create(:student, cohort: @cohort)
    sign_in(@student)
  end

  describe '#new' do
    it 'assigns the @todo variable' do
      get :new, user_id: @student.id
      expect(assigns(:todo)).to be_a_new(Todo)
    end
  end

  describe '#create' do
    before do
      @params = { todo: { item: 'Do This' },
                  user_id: @student.id
                }
    end

    it 'saves the todo' do
      expect {
        post :create, @params
      }.to change(Todo, :count).by(1)
    end

    it 'renders new template if unsuccessfull' do
      @params = { todo: { item: nil },
                  user_id: @student.id
                }
      post :create, @params
      expect(response).to render_template :new
    end
  end

  describe '#destroy' do
    before do
      @todo = create(:todo, user: @student)
      @params = { id: @todo.id,
                  user_id: @student.id }
    end

    it 'destroys the todo' do
      expect {
        delete :destroy, @params
      }.to change(Todo, :count).by(-1)
    end
  end
end
