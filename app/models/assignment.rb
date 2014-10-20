class Assignment < ActiveRecord::Base
  belongs_to :cohort
  has_many :pull_requests
  has_many :answers, dependent: :destroy
  validates :name, :description, presence: :true

  def accepted_answers
    answers.where(accepted: true)
  end

  def percent_answers_accepted
    100.0 * (accepted_answers.count.to_f / cohort.users.student.count)
  end

  def percent_answered
    100.0 * (answers.count.to_f / cohort.users.student.count)
  end
end
