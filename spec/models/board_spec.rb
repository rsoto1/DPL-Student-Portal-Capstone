require 'rails_helper'

RSpec.describe Board, :type => :model do
  describe 'associations' do
    it { should have_many :conversations }
  end

  describe 'most_recent_comments' do
    before do
      @board = create(:board)
      @conversation = create(:conversation, board: @board)
      @comments = create_list(:comment, 50, conversation: @conversation)
    end

    it 'should return the most recent comment' do
      @comment = @comments.last
      @comment.update!(body: 'Y U No Work!?')
      expect(@board.most_recent_comment.id).to eq @comment.id
    end
  end
end
