class Dashboard::BaseController < ApplicationController
  include SetCohort
  before_action :authenticate_user!
  before_action :set_cohort
  def index
  end

  def leaderboard
    @leaders = Merit::Score.top_scored(cohort: @cohort.id)
  end
end
