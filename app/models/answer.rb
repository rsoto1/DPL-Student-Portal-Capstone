class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  validates :title, :body, presence: :true
end
