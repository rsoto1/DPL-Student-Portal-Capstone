class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :attendances, dependent: :destroy
  has_many :announcements, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :cohort

  enum role: [:student, :staff]
end
