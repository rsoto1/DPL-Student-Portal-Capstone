class Notification < ActiveRecord::
	belongs_to :user

	validates :user_id, :message, :sender_email, :sender_name, presence: :true 
 
end
