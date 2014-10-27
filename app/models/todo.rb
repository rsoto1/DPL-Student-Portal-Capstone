class Todo < ActiveRecord::Base
  has_many :users
end
