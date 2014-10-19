class Board < ActiveRecord::Base
  has_many :conversations, :dependent => :destroy
  validates_length_of :title, :maximum => 50
end
