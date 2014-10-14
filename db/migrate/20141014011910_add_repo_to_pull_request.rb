class AddRepoToPullRequest < ActiveRecord::Migration
  def change
    add_reference :pull_requests, :repo, index: true
  end
end
