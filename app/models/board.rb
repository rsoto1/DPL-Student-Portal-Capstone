class Board < ActiveRecord::Base
  has_many :conversations, :dependent => :destroy
  validates_length_of :title, :maximum => 50

  def most_recent_comment
    self.conversations.order(:last_comment_at).last
  end
end
