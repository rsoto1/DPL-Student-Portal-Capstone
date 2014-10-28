class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_filter :load_conversation
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @conversation.comments
  end

  def show
  end

  def new
    @comment = @conversation.comments.new
    # @board = @conversation.board
  end

  def edit
    # @comment = Comment.find(params[:id])
  end

  def create
    @comment = @conversation.comments.new(comment_params)
    @comment.user = current_user
    if current_user && @comment.save
      current_user.add_points(5, category: 'Discussions')
      @comment.update_attributes(user_id: current_user.id)
      @conversation.update_attributes(last_commenter_id: @comment.user.id,
                                      last_comment_at: Time.now)
      redirect_to board_conversation_path(@conversation.board_id, @conversation.id)
    else
      render :new
    end
  end

  def update
    # @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      @comment.conversation.update_attributes(last_commenter_id: @comment.user.id,
                                              last_comment_at: Time.now)
      redirect_to board_conversation_path(@conversation.board_id, @conversation.id),
                  notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # @comment = Comment.find(params[:id])
    @comment.destroy
    @comment.user.subtract_points(10, category: 'Discussions')
    redirect_to board_url(@conversation.board), notice: 'Comment was successfully deleted.'
  end

  private

  def load_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body,
                                    :user_id,
                                    :conversation_id,
                                    :last_comment_at,
                                    :last_commenter_id)
  end
end
