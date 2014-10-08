class Dashboard::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def edit
  end

  def update
    if current_user.update_info(user_params)
      sign_in current_user, bypass: true
      redirect_to dashboard_path, notice: 'User profile updated!'
    else
      alert_and_render('Could not update your profile...', :edit)
    end
  end

  def profile
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :hometown,
                                 :github_username,
                                 :github_email,
                                 :github_state,
                                 :github_access_token,
                                 :provider,
                                 :uid)
  end
end
