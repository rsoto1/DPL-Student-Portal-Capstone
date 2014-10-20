class ConversationsController < ApplicationController
  # before_filter :load_board
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  def index
    @conversations = Conversations.all
  end

  def show
  end

  def new
    @conversation = Conversations.new
  end

  def edit
  end

  def create
    @conversation = Conversations.new(:conversation)
    if @conversation.save
      @conversation = Conversation.new(:title => params[:conversation][:title], :last_commenter_id => current_user.id, :last_post_at => Time.now, :board_id => params[:conversation][:board_id], :user_id => current_user.id)
      if @comment.save
        notice:'Successfully started a conversation.'
        redirect_to @conversation
      else
        render :new
      end
    else
      render :new
    end
  end

  def update
      if @conversation.update(conversation_params)
        notice:'Conversation was successfully updated.'
        redirect_to @conversations
      else
        render :edit
      end
    end

  def destroy
    @conversation.destroy
    notice:'Conversation was successfully destroyed.'
    redirect_to board_conversations_url(@board)
  end

  private
    # def load_board
    #     @board = Board.find(params[:id])
    # end

    def set_conversation
        @conversation ||= Conversations.find(params[:id])
    end

    def conversation_params
      params.require(:conversation).permit(:title, :last_commenter_id, :last_comment_at)
    end
end
