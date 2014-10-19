class Staff::MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  #may need to change to set_staff
  
  def index
    @members = User.all
  end

  def show
    @member = User.find(member_params[:id])
  end

  def new
    @member = User.new(role: :staff)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @member = User.new(role: :staff)
     # @member = Member.new(member_params)
    if @member.save
      redirect_to staff_base_admin_path, notice: 'Welcome to the family!'
    else
      alert_and_render('Could not save admin info', :new)
    end
  end

  def edit
  end

  def update
    if @member.update_attributes(member_params)
      redirect_to staff_path, notice: 'All up to date'
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
    @member = Member.find(params[:id])
  end
 
  def member_params
    params.require(:member).permit(:first_name, :last_name, :email)
  end
end










 
 
 

 


