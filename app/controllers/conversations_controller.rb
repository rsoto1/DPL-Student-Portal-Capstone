class ConversationsController < ApplicationController
  before_filter :load_board
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]
  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = @board.conversations
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
  end

  # GET /conversations/new
  def new
    @conversation = @board.conversations.build(params[:conversation_id])
  end

  # GET /conversations/1/edit
  def edit
  end

  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = @board.conversations.build(params[:conversation])

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to @board, notice: 'Conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to board_conversations_url(@board), notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_board
        @board = Board.find(params[:board_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.require(:conversation).permit(:id, :board_id, :user_id, :title, :last_commenter_id, :last_comment_at)
    end
end
