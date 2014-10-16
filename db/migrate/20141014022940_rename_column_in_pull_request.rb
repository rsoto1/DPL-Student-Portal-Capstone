class RenameColumnInPullRequest < ActiveRecord::Migration
  def change
    rename_column :pull_requests, :repo, :repo_name
  end
end
