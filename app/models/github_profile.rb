# == Schema Information
#
# Table name: github_profiles
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  username     :string(255)
#  email        :string(255)
#  name         :string(255)
#  image        :string(255)
#  location     :string(255)
#  public_repo  :integer
#  public_gists :integer
#  member_since :string(255)
#  access_token :string(255)
#  state        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class GithubProfile < ActiveRecord::Base
end
