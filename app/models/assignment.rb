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
end
