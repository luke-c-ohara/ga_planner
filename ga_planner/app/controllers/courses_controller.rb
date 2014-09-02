class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course.create(params[:course])
    @course.save
    redirect_to courses_path
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update_attributes(params[:course])
    redirect_to(@course)
  end 

  def show
    @course = Course.find(params[:id])
  end 

  def destroy
    course = Course.find(params[:id])
    course.destroy
    redirect_to courses_path :notice => "Successfully destroyed course."
  end 

end
