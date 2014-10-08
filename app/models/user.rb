class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:github]
  belongs_to :cohort
  # has_many :attendances, dependent: :destroy
  # has_many :announcements, dependent: :destroy
  # has_many :notifications, dependent: :destroy

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

  def self.get_and_update_from_omniauth(auth)
    user = where("email = ? OR github_email = ? OR provider = ? AND uid = ? ",
                 auth.info.email,
                 auth.info.email,
                 auth.provider,
                 auth.uid).first
    user.first_name, user.last_name = auth.info.name.split(' ')
    user.last_name = '' if user.last_name.nil? # shit breaks if last_name is nil
    user.github_username = auth.extra.raw_info.login
    user.github_access_token = auth.credentials.token
    user.github_state = 'completed'
    user.provider = auth.provider
    user.uid = auth.uid
    user
    # user.email = auth.info.email
    # user.password = Devise.friendly_token[0,20]
    # user.image = auth.info.image # assuming the user model has an image
    # where("email = ? OR provider = ? AND uid = ? ", auth.info.email, auth.provider, auth.uid).first_or_create do |user|
    # where(email: auth.info.email).where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  end
end
