class Schedule < ActiveRecord::Base
  belongs_to :cohort
  validates :day, :description, presence: true
end
