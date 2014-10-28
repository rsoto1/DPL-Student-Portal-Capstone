require 'rails_helper'

RSpec.describe BoardsController, :type => :controller do
  before do
    @location = create(:location)
    @cohort = create(:cohort, location: @location)
    @staff = create(:staff)
    sign_in(@staff)
  end

  describe '#index' do
    it 'successfully gets the index page' do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it 'assigns the @locations variable' do
      get :index
      expect(assigns(:boards)).to eq(Board.all)
    end
  end

  describe '#show' do
    before do
      @board = create(:board)
    end
    it 'renders info about a board' do
      get :show, id: @board.id
      expect(response).to be_success
      expect(assigns(:board).title).to eq @board.title
      expect(response).to render_template('show')
    end
  end

  describe '#new' do
    it 'assigns a new board as @board' do
      get :new
      expect(assigns(:board)).to be_a_new(Board)
    end
  end

  describe '#create' do
    before do
      @params = { board: { title: 'Some Title' }
                }
    end

    it 'saves the board' do
      expect {
        post :create, @params
      }.to change(Board, :count).by(1)
    end
  end

  describe '#update' do
    before do
      @board = create(:board)
      @params = { id: @board.id,
                  board: { title: 'Somewhere' }
                }
    end

    it 'updates the board' do
      patch :update, @params
      assert_response :redirect
      board = Board.find(@board.id)
      expect(board.title).to eq 'Somewhere'
    end
  end

  describe '#destroy' do
    before do
      @board = create(:board)
      @params = { id: @board.id }
    end

    it 'destroys the board' do
      expect {
        delete :destroy, @params
      }.to change(Board, :count).by(-1)
    end
  end
end
