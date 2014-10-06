class Dashboard::AttendancesController < ApplicationController
  before_action :authenticate_user!
end
