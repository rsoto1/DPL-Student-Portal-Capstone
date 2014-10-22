require 'rails_helper'
require 'pry'

RSpec.describe Assignment, :type => :model do

  before do
    @assignment = FactoryGirl.build(:assignment)
  end

  it "should be invalid if it has no name" do
    @assignment.name = nil
    @assignment.should_not be_valid
  end

end
