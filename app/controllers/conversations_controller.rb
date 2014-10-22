class ConversationsController < ApplicationController
  before_filter :load_board
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  def index
    # @conversations = Conversation.all
    @conversations = @board.conversations
    # @comment = Comment.new
  end

  def show
  end

  def new
    @conversation = Conversation.new
    # @comment = @conversation.comments.build
  end

  def edit
  end

  def create
    @conversation = @board.conversations.new(conversation_params)
    @conversation.user = current_user
    if @conversation.save
        redirect_to board_conversations_url(@board)
    else
      render :new
    end
  end

  def update
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
        @conversation = Conversation.find(params[:id])
    end

    def conversation_params
      params.require(:conversation).permit(:title,
                                           :description,
                                           :last_commenter_id || current_user.id,
                                           :last_comment_at || Time.now,
                                           :user_id,
                                           :board_id)
    end
end
