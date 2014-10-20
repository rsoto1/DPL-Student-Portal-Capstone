class ConversationsController < ApplicationController
  before_filter :load_board
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  def index
    @conversations = @board.conversations.all
  end

  def show
  end

  def new
    @conversation = @board.conversations.new
  end

  def edit
  end

  def create
    @conversation = @board.conversations.new(board_params)
      if @conversation.save
        redirect_to @conversation, notice:'Conversation was successfully created.'
      else
        render :new
      end
    end

  def update
    @conversation = @board.conversations.find(params[:id])
      if @conversation.update(conversation_params)
        redirect_to @conversations, notice:'Conversation was successfully updated.'
      else
        render :edit
      end
    end

  def destroy
    @conversation.destroy
      redirect_to board_conversations_url(@board), notice:'Conversation was successfully destroyed.'
  end

  private
    def load_board
        @board = Board.find(params[:board_id])
    end

    def set_conversation
        @conversation ||= @board.conversations.find(params[:id])
    end

    def conversation_params
      params.require(:conversation).permit(:id, :board_id, :user_id, :title, :last_commenter_id, :last_comment_at)
    end
end
