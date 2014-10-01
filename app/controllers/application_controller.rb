class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  def after_sign_in_path_for(user)
    user.staff? ? staff_path : dashboard_path
  end

  protected

  def alert_and_render(message, action)
    flash[:alert] = message
    render action
  end

  def layout_by_resource
    if devise_controller?
      'public'
    else
      'application'
    end
  end

  def ensure_staff!
    redirect_to root_path unless current_user && current_user.staff?
  end
end
