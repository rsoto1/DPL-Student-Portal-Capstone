# == Schema Information
#
# Table name: answers
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  assignment_id   :integer
#  title           :string(255)
#  body            :text
#  accepted        :boolean
#  created_at      :datetime
#  updated_at      :datetime
#  pull_request_id :integer
#

class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  has_one :pull_request
  validates :title, :body, presence: :true
  validate :users_only_answer

  private

  def users_only_answer
    unless assignment.answers.where(user: user).count == 0
      errors.add(:user, 'has already submitted an answer for this assignment')
    end
  end
end
