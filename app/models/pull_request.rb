class PullRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  belongs_to :answer
  belongs_to :repo
end
