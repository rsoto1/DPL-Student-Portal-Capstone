class AddColumnToPullRequests < ActiveRecord::Migration
  def change
    add_reference :pull_requests, :answer_id, index: true
  end
end
