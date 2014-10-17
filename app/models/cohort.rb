class Cohort < ActiveRecord::Base
  belongs_to :location
  belongs_to :course
  has_many :users, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :repos, dependent: :destroy
end
