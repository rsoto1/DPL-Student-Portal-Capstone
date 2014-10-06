class RegistrationsController < Devise::RegistrationsController
  before_action :ensure_staff!, only: [:new, :create]
  layout 'application', only: [:edit]

  def new
  end

  def create
  end

  def after_update_path_for(resource)
    case resource
    when :user, User
      resource.staff? ? staff_path : dashboard_profile_path
    else
      super
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :github_username,
                                 :hometown,
                                 :password,
                                 :password_confirmation,
                                 :current_password)
  end
end
