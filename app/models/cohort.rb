class Cohort < ActiveRecord::Base
  belongs_to :location
  has_many :users, dependent: :destroy
  has_many :assignments, dependent: :destroy
end
