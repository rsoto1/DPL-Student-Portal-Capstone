class Staff::UsersController < ApplicationController
  include SetCohort
  before_action :authenticate_user!
  before_action :ensure_staff!, only: [:new, :create]
  before_action :set_cohort
  before_action :set_student, only: [:edit, :update, :destroy]

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
      redirect_to staff_cohort_path(@cohort), notice: 'Student created!'
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

  def destroy
    @student.destroy
    redirect_to staff_cohort_path(@cohort), notice: 'Student was deleted'
  end

  def profile
    @user = current_user
  end

  private

  def set_student
    @student = @cohort.users.find(params[:id])
  end

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
