# == Schema Information
#
# Table name: notifications
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  read         :boolean
#  message      :text
#  sender_name  :string(255)
#  sender_email :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Notification < ActiveRecord::Base
	belongs_to :user
  validates :user_id, :message, :sender_email, :sender_name, presence: :true
end
