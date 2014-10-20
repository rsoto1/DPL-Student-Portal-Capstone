class ConversationsController < ApplicationController
  before_filter :load_board
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  def index
    @conversations = Conversation.all
  end

  def show
  end

  def new
    current_user.add_points(20)
    @conversation = Conversation.new
    @comment = @conversation.comments.build
  end

  def edit
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @comment = @conversation.comments.build(params[:comment])
    if @conversation.save
      @conversation = Conversation.new(:title => params[:conversation][:title], :last_commenter_id => current_user.id, :last_comment_at => Time.now, :board_id => params[:conversation][:board_id])
      if @comment.save
        redirect_to @conversation, notice:'Successfully started a conversation.'
      else
        render :new
      end
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
        @conversation = Conversations.find(params[:id])
    end

    def conversation_params
      params.require(:conversation).permit(:title, :last_commenter_id, :last_comment_at, :user_id)
    end
end
