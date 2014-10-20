# == Schema Information
#
# Table name: repos
#
#  id         :integer          not null, primary key
#  cohort_id  :integer
#  name       :string(255)
#  link       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Repo < ActiveRecord::Base
  belongs_to :cohort
  has_many :pull_requests
end
