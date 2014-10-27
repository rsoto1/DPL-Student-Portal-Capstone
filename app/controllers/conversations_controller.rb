class ConversationsController < ApplicationController
  before_filter :load_board
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  def index
    @conversations = @board.conversations
  end

  def show
  end

  def new
    @conversation = Conversation.new
  end

  def edit
  end

  def create
    @conversation = @board.conversations.new(conversation_params)
    @conversation.user = current_user
    if current_user && @conversation.save
      current_user.add_points(10)
      @conversation.update_attributes(:user_id => current_user.id)
        redirect_to board_conversation_path(@conversation.board_id, @conversation.id)
    else
      render :new
    end
  end

  def update
    @conversation = Conversation.find(params[:id])
      if @conversation.update(conversation_params)
        @conversation.update_attributes(:user_id => current_user.id)
        redirect_to @conversations, notice:'Conversation was successfully updated.'
      else
        render :edit
      end
    end

  def destroy
    @conversation.destroy
    @conversation.user.subtract_points(25)
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
