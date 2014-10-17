class AddColumnToPullRequests < ActiveRecord::Migration
  def change
    add_reference :pull_requests, :answer, index: true
  end
end
