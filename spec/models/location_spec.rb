require 'rails_helper'

RSpec.describe Location, :type => :model do
  describe 'associations' do
    it { should have_many :cohorts }
  end

  describe 'validates name' do
    it { should validate_presence_of :name }
  end
end
