require 'rails_helper'

RSpec.describe ConversationsController, :type => :controller do
  before do
    @location = create(:location)
    @cohort = create(:cohort, location: @location)
    @staff = create(:staff)
    @board = create(:board)
    sign_in(@staff)
  end

  # No index route for conversations?
  describe '#index' do
    it 'successfully gets the index page' do
      get :index, board_id: @board.id
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it 'assigns the @conversations variable' do
      get :index, board_id: @board.id
      expect(assigns(:conversations)).to eq(@board.conversations)
    end
  end

  describe '#show' do
    before do
      @conversation = create(:conversation, board: @board)
    end
    it 'renders info about a conversation' do
      get :show, id: @conversation.id, board_id: @board.id
      expect(response).to be_success
      expect(assigns(:conversation).title).to eq @conversation.title
      expect(response).to render_template(:show)
    end
  end

  describe '#new' do
    it 'assigns a new conversation as @conversation' do
      get :new, board_id: @board.id
      expect(assigns(:conversation)).to be_a_new(Conversation)
    end
  end

  describe '#create' do
    before do
      @params = { conversation: { title: 'Some Convo',
                                  description: 'Moar hot air' },
                  board_id: @board.id
                }
    end

    it 'saves the conversation' do
      expect {
        post :create, @params
      }.to change(@board.conversations, :count).by(1)
    end
  end

  describe '#update' do
    before do
      @conversation = create(:conversation, board: @board)
      @params = { id: @conversation.id,
                  conversation: { title: 'Somewhere' },
                  board_id: @board.id,
                  user_id: @staff.id
                }
    end

    it 'updates the conversation' do
      patch :update, @params
      assert_response :redirect
      conversation = Conversation.find(@conversation.id)
      expect(conversation.title).to eq 'Somewhere'
    end
  end

  describe '#destroy' do
    before do
      @conversation = create(:conversation, board: @board)
      @params = { id: @conversation.id, board_id: @board.id }
    end

    it 'destroys the conversation' do
      expect {
        delete :destroy, @params
      }.to change(Conversation, :count).by(-1)
    end
  end
end
