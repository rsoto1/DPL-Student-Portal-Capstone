class Member < ActiveRecord::Base
  belongs_to :staff
  validates :first_name, :last_name, :email, presence: true
end
