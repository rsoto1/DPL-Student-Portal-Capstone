# == Schema Information
#
# Table name: assignments
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category    :string(255)
#  cohort_id   :integer
#  description :text
#  due_date    :date
#  created_at  :datetime
#  updated_at  :datetime
#

class Assignment < ActiveRecord::Base
  belongs_to :cohort
  has_many :pull_requests
  has_many :answers, dependent: :destroy
  validates :name, :description, presence: :true

  def accepted_answers
    answers.where(accepted: true)
  end

  def percent_answers_accepted
    # should probably change to accepted answers / total answers
    100.0 * (accepted_answers.count.to_f / cohort.users.student.count)
  end

  def percent_answered
    100.0 * (answers.count.to_f / cohort.users.student.count)
  end
end
