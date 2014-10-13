class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :cohort
  has_many :attendances, dependent: :destroy
  has_many :announcements, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :answers, dependent: :destroy
  belongs_to :cohort

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
end
