class Staff::UsersController < ApplicationController
  include SetCohort
  before_action :authenticate_user!
  before_action :ensure_staff!, only: [:new, :create]
  before_action :set_cohort

  def index
  end

  def edit
  end

  def new
    @student = @cohort.users.build_with_temp_password
  end

  def create
    @student = @cohort.users.build_with_temp_password(user_params)

    if @student.save
      # redirect_to staff_cohort_users_path(@cohort), notice: 'Student created!'
      redirect_to staff_path, notice: 'Student created!'
    else
      alert_and_render('Could not add new student', :new)
    end
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
                                 :github_username)
  end
end
