# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  duration      :integer
#  duration_unit :string(255)
#  price         :decimal(8, 2)
#  created_at    :datetime
#  updated_at    :datetime
#

class Course < ActiveRecord::Base
  has_many :cohorts
end
