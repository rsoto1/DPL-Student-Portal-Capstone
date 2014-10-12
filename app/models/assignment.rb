class Assignment < ActiveRecord::Base
  belongs_to :cohort
  validates :name, presence: :true
  
end
