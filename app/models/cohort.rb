class Cohort < ActiveRecord::Base
  belongs_to :location
  has_many :users, dependent: :destroy
end
