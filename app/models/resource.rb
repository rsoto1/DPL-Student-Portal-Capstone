class Resource < ActiveRecord::Base
  belongs_to :user
  validates :title, :name, :url, presence: :true
end
