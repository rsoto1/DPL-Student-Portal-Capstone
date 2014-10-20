# == Schema Information
#
# Table name: attendances
#
#  id         :integer          not null, primary key
#  present    :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Attendance < ActiveRecord::Base
	belongs_to :user
end
