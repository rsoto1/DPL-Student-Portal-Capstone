class Assignment < ActiveRecord::Base
  belongs_to :cohort
  has_many :answers, dependent: :destroy
  validates :name, :description, presence: :true
end
