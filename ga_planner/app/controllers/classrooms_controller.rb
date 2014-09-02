class ClassroomsController < ApplicationController

  def index
    @classrooms = Classroom.all
  end

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom.create(params[:classroom])
    @classroom.save
    redirect_to classrooms_path
  end

  def edit
    @classroom = Classroom.find(params[:id])
  end

  def update
    @classroom = Classroom.find(params[:id])
    @classroom.update_attributes(params[:classroom])
    redirect_to(@classroom)
  end 

  def show
    @classroom = Classroom.find(params[:id])
  end 

  def destroy
    classroom = Classroom.find(params[:id])
    classroom.destroy
    redirect_to classrooms_path :notice => "Successfully destroyed classroom."
  end 

end

