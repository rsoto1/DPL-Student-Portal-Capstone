class Assignment < ActiveRecord::Base
  belongs_to :cohort
  validates :name, :description, presence: :true
end
