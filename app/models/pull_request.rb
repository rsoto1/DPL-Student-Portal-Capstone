# == Schema Information
#
# Table name: pull_requests
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  assignment_id       :integer
#  repo_name           :string(255)
#  title               :string(255)
#  pull_request_number :integer
#  body                :text
#  link                :string(255)
#  mergeable           :boolean
#  merged              :boolean
#  sha                 :string(255)
#  action              :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  answer_id           :integer
#  repo_id             :integer
#

class PullRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  belongs_to :answer
  belongs_to :repo
end
