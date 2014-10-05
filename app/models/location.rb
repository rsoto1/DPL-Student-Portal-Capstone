class Location < ActiveRecord::Base
  has_many :cohorts, dependent: :destroy
  validates :name, presence: true
end
