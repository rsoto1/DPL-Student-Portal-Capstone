class Dashboard::UsersController < ApplicationController
  def index
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :hometown,
                                 :github_username)
  end 
end
