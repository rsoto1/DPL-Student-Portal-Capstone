class Event < ActiveRecord::Base
  validates :name, :starts_at, :ends_at, presence: :true
end
