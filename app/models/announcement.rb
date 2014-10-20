# == Schema Information
#
# Table name: announcements
#
#  id         :integer          not null, primary key
#  text       :text
#  posted_by  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Announcement < ActiveRecord::Base
	belongs_to :user
end
