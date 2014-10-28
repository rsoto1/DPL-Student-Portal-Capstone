require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
  before do
    @location = create(:location)
    @cohort = create(:cohort, location: @location)
    @staff = create(:staff)
    @board = create(:board)
    @conversation = create(:conversation)
    sign_in(@staff)
  end

  describe '#index' do
    it 'successfully gets the index page' do
      get :index, board_id: @board.id, conversation_id: @conversation.id
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it 'assigns the @comments variable' do
      get :index, board_id: @board.id, conversation_id: @conversation.id
      expect(assigns(:comments)).to eq(@conversation.comments)
    end
  end

  describe '#show' do
    before do
      @comment = create(:comment, conversation: @conversation)
    end
    it 'renders info about a comment' do
      get :show, id: @comment.id,
                 board_id: @board.id,
                 conversation_id: @conversation.id
      expect(response).to be_success
      expect(assigns(:comment).body).to eq @comment.body
      expect(response).to render_template(:show)
    end
  end

  describe '#new' do
    it 'assigns a new comment as @comment' do
      get :new, board_id: @board.id, conversation_id: @conversation.id
      expect(assigns(:comment)).to be_a_new(Comment)
    end
  end

  describe '#create' do
    before do
      @params = { comment: { body: 'Some Comment' },
                  board_id: @board.id, 
                  conversation_id: @conversation.id
                }
    end

    it 'saves the comment' do
      expect {
        post :create, @params
      }.to change(@conversation.comments, :count).by(1)
    end
  end

  describe '#update' do
    before do
      @comment = create(:comment, conversation: @conversation)
      @params = { id: @comment.id,
                  comment: { body: 'Something' },
                  conversation_id: @conversation.id,
                  last_commenter_id: @staff.id,
                  board_id: @board.id,
                  user_id: @staff.id
                }
    end

    it 'updates the comment' do
      patch :update, @params
      assert_response :redirect
      comment = Comment.find(@comment.id)
      expect(comment.body).to eq 'Something'
    end
  end

  describe '#destroy' do
    before do
      @comment = create(:comment, conversation: @conversation)
      @params = { id: @comment.id,
                  board_id: @board.id,
                  conversation_id: @conversation.id }
    end

    it 'destroys the conversation' do
      expect {
        delete :destroy, @params
      }.to change(Comment, :count).by(-1)
    end
  end
end
