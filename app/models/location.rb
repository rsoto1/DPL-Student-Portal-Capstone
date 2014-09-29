class Location < ActiveRecord::Base
  has_many :cohorts, dependent: :destroy
end
