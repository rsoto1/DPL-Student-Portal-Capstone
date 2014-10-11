class Staff::BaseController < ApplicationController
  before_action :authenticate_user!
  def index
    @cohorts = Cohort.all
  end
  def admin
    @location = Location.new
    @course = Course.new
  end

end
