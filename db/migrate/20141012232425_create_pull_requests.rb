class CreatePullRequests < ActiveRecord::Migration
  def change
    create_table :pull_requests do |t|
      t.belongs_to :user, index: true
      t.belongs_to :assignment, index: true
      t.string :repo
      t.string :title
      t.integer :pull_request_number
      t.text :body
      t.string :link
      t.boolean :mergeable
      t.boolean :merged
      t.string :sha
      t.string :action

      t.timestamps
    end
  end
end
