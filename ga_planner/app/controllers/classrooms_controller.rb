class ClassroomsController < ApplicationController
  load_and_authorize_resource

    def index
      @classrooms = Classroom.all
    end

    def show
      @classroom = Classroom.find(params[:id])
    end

    def new
      @classroom = Classroom.new
    end

    def create
      @classroom = Classroom.new(params[:classroom])
      if @classroom.save
        redirect_to @classroom, :notice => "Successfully created classroom."
      else
        render :action => 'new'
      end
    end

    def edit
      @classroom = Classroom.find(params[:id])
    end

    def update
      @classroom = Classroom.find(params[:id])
      if @classroom.update_attributes(params[:classroom])
        redirect_to @classroom, :notice  => "Successfully updated classroom."
      else
        render :action => 'edit'
      end
    end

    def destroy
      @classroom = Classroom.find(params[:id])
      @classroom.destroy
      redirect_to classrooms_url, :notice => "Successfully destroyed classroom."
    end
  end

