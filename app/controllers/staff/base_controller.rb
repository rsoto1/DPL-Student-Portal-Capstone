class Staff::BaseController < ApplicationController
  before_action :authenticate_user!
  def index
    @cohorts = Cohort.all
    @cohort = Cohort.new
  end
  def admin
    @location = Location.new
    @course = Course.new
    @member = User.new
    @locations = Location.all
    @courses = Course.all
    @members = User.staff.all
  end

end

 
