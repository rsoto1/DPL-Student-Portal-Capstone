class Staff::LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to staff_path, notice: 'Welcome to the family'
    else
      alert_and_render('Could not save location info', :new)
    end
  end

  def edit
  end

  def update
    if @location.update_attributes(location_params)
      redirect_to staff_path, notice: 'All up to date'
    else
      alert_and_render('There was an issue updating', :edit)
    end
  end

  def destroy
    @location.destroy
    redirect_to staff_path, notice: 'Sad to see you go'
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :time_zone_name)
  end

end
