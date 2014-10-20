# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  starts_at   :datetime
#  ends_at     :datetime
#  all_day     :boolean
#  description :text
#  color       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base
  validates :name, :starts_at, :ends_at, presence: :true
end
