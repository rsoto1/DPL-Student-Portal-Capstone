# == Schema Information
#
# Table name: cohorts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  starts_at   :datetime
#  ends_at     :datetime
#  location_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  course_id   :integer
#

class Cohort < ActiveRecord::Base
  belongs_to :location
  belongs_to :course
  has_many :users, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :repos, dependent: :destroy
  has_many :schedules, dependent: :destroy
end
