class CreateGithubProfiles < ActiveRecord::Migration
  def change
    create_table :github_profiles do |t|
      t.integer :user_id
      t.string :username
      t.string :email
      t.string :name
      t.string :image
      t.string :location
      t.integer :public_repo
      t.integer :public_gists
      t.string :member_since
      t.string :access_token
      t.string :state

      t.timestamps
    end
  end
end
