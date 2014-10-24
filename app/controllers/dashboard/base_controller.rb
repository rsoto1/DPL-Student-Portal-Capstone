class Dashboard::BaseController < ApplicationController
  before_action :authenticate_user!
  def index
    @assignments = Assignment.all
  end
end
