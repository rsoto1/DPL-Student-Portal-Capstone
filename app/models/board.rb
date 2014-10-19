class Board < ActiveRecord::Base
  has_many :conversations, :dependant => :destroy
  validates_length_of :title, :maximum => 50
end
