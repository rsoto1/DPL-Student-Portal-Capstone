# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  github_username        :string(255)
#  hometown               :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  cohort_id              :integer
#  first_name             :string(255)
#  role                   :integer          default(0)
#  last_name              :string(255)
#  temp_password          :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  github_state           :string(255)
#  github_access_token    :string(255)
#  github_email           :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:github]
  belongs_to :cohort
  has_one :github_profile
  has_many :pull_requests
  # has_many :attendances, dependent: :destroy
  # has_many :announcements, dependent: :destroy
  # has_many :notifications, dependent: :destroy
  has_many :answers, dependent: :destroy

  enum role: [:student, :staff]

  def self.build_with_temp_password(attributes = {})
    token = Devise.friendly_token
    attributes.merge!(temp_password: token,
                      password: token,
                      password_confirmation: token)
    new(attributes)
  end

  def update_info(new_attributes)
    new_attributes.merge!(temp_password: nil)
    if new_attributes[:password].blank?
      update_without_password(new_attributes)
    else
      update_attributes(new_attributes)
    end
  end

  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #       user.first_name, user.last_name = data['name'].split(' ')
  #       user.github_username = data['login']
  #       user.github_access_token = session["devise.github_data"]['credentials']['token']
  #       user.github_state = 'completed'
  #     end
  #   end
  # end

  def self.from_omniauth(auth)
    where('provider = ? AND uid = ?',
          auth.provider,
          auth.uid).first
  end

  def create_github_profile
    client = Octokit::Client.new access_token: github_access_token
    user = client.user
    self.update_attributes(uid: user.id)
    GithubProfile.create(user_id: id,
                         username: user.login || '',
                         email: client.emails.select { |el| el['primary'] }.first.email || '',
                         name: user.name || '',
                         image: user.avatar_url || '',
                         public_repo: user.public_repos || '',
                         public_gists: user.public_gists || '',
                         member_since: user.created_at || '',
                         access_token: client.access_token || '')
    # GithubProfile.create(user_id: id,
    #                      username: auth.info.nickname || '',
    #                      email: auth.info.email || '',
    #                      name: auth.info.name || '',
    #                      image: auth.info.image || '',
    #                      location: auth.extra.raw_info.location || '',
    #                      public_repo: auth.extra.raw_info.public_repos || '',
    #                      public_gists: auth.extra.raw_info.public_gists || '',
    #                      member_since: auth.extra.raw_info.created_at || '',
    #                      access_token: auth.credentials.token)
  end

  def generate_github_state!
    self.update_attributes(github_state: self.generate_github_state)
    self.github_state
  end

  def generate_github_state
    SecureRandom.hex
  end

  def authorized_for_github!(authorized_token)
    self.update_attributes(github_access_token: authorized_token,
                           github_state: 'linked',
                           provider: 'github')
  end

  def github_authorized?
    self[:github_access_token] && self[:github_state] == 'linked'
  end
end
