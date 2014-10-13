class Staff::BaseController < ApplicationController
  before_action :authenticate_user!
  def index
    @cohorts = Cohort.all
    @cohort = Cohort.new
  end
  def admin
    @location = Location.new
    @course = Course.new
    @locations = Location.all
    @courses = Course.all
  end

end
