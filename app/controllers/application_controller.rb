class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  layout :layout_by_resource

  def after_sign_in_path_for(user)
    if user.staff?
      staff_path
    else
      dashboard_path
    end
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

end