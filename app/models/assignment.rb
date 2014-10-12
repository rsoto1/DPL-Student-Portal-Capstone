class Assignment < ActiveRecord::Base
  belongs_to :cohort
  has_many :pull_requests
  validates :name, presence: :true
end
