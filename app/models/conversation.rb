class Conversation < ActiveRecord::Base
  belongs_to :board
  belongs_to :user
  has_many :comments, :dependant => :destroy
  validates_presence_of :title
  validates_length_of :title, :maximum=>50
end
