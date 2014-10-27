class Dashboard::BaseController < ApplicationController
  include SetCohort
  before_action :authenticate_user!
  before_action :set_cohort

  def index
    @assignments = @cohort.assignments.all
    @schedules = Schedule.all
    @schedule = Schedule.new
  end
end

