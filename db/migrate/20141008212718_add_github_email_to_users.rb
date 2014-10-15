class AddGithubEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :github_email, :string
  end
end
