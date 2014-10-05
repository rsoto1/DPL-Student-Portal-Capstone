class Staff::CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
  end

  def edit
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to staff_courses_path, notice: 'Course has been added!'
    else
      alert_and_render('Could not save course info', :new)
    end
  end

  def update
    if @course.update_attributes(course_params)
      redirect_to @course, notice: 'All up to date'
    else
      alert_and_render('There was an issue updating', :edit)
    end
  end

  def destroy
    @course.destroy
    redirect_to staff_path, notice: 'Course has been deleted'
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name,
                                 :description,
                                 :duration,
                                 :price)
  end
end
