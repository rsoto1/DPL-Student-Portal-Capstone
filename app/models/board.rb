class Board < ActiveRecord::Base
  has_many :conversations, :dependent => :destroy
  validates_length_of :title, :maximum => 50

  def most_recent_comment
    conversation = Conversation.first(:order => 'last_comment_at DESC', :conditions => ['board_id = ?', self.id])
      return conversation
  end
end
