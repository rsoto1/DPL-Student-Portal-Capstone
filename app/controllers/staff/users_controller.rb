class Staff::UsersController < ApplicationController
  include SetCohort
  before_action :authenticate_user!
  before_action :ensure_staff, only: [:new, :create]
  before_action :set_cohort
  before_action :set_student, only: [:show, :edit, :update, :destroy]

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
      StudentMailer.welcome_email(@student).deliver
      redirect_to staff_cohort_path(@cohort), notice: 'Student created!'
    else
      alert_and_render('Could not add new student', :new)
    end
  end  


  def update
    if @student.update_info(user_params)
      redirect_to staff_cohort_path(@cohort), notice: 'Student updated!'
    else
      alert_and_render('Could not update student', :edit)
    end
  end

  def destroy
    @student.destroy
    redirect_to staff_cohort_path(@cohort), notice: 'Student was deleted'
  end

  def profile
    @user = current_user
  end

  def show
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
                                 :github_username,
                                 :github_email)
  end
end
