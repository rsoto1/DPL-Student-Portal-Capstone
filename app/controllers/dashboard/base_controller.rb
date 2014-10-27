class Dashboard::BaseController < ApplicationController
  include SetCohort
  before_action :authenticate_user!
  before_action :set_cohort

  def index
    @assignments = @cohort.assignments.all
  end
end

