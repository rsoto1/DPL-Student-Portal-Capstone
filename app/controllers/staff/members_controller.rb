class Staff::MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @members = User.staff.all
  end

  def show
  end

  def new
    @member = User.new(role: :staff)
  end

  def create
    @member = User.build_with_temp_password(member_params)
    @member.staff!
    if @member.save
      redirect_to staff_members_path, notice: 'Welcome to the family!'
    else
      alert_and_render('Could not save admin info', :new)
    end
  end

  def edit
  end

  def update
    if @member.update_attributes(member_params)
      redirect_to staff_member_path(@member), notice: 'All up to date'
    else
      alert_and_render('There was an issue updating', :edit)
    end
  end

  def destroy
    @member.destroy
    redirect_to staff_base_admin_path, notice: 'Sad to see you go'
  end

  private

  def set_member
    @member = User.find(params[:id])
  end

  def member_params
    params.require(:user).permit(:first_name, :last_name, :email, :role)
  end
end
