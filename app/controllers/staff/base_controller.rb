class Staff::BaseController < ApplicationController
  before_action :authenticate_user!
  def index
    @cohorts = Cohort.all
  end
end
