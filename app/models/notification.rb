class Notification < ActiveRecord::
	belongs_to :user

	validates :user_id, presence: :true
  validates :message, presence: :true
  validates :sender_email, presence: :true
  validates :sender_name, presence: :true
  
end
