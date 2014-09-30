class Staff::BaseController < ApplicationController
  def index
    @cohorts = Cohort.all
  end
end
