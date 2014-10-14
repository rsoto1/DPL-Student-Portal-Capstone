class Repo < ActiveRecord::Base
  belongs_to :cohort
  has_many :pull_requests
end
