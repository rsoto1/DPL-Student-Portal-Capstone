class SiteController < ApplicationController
  before_action :authenticate_user!
  before_action :route_user

  layout 'public'

  def index
  end

  private

  def route_user
    if current_user && current_user.student?
      redirect_to dashboard_path
    elsif current_user && current_user.staff?
     redirect_to staff_path
    end
  end
end
