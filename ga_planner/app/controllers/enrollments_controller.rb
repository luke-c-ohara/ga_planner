class EnrollmentsController < ApplicationController

    def index
      @enrollments = Enrollment.all
    end

    def show
      @enrollment = Enrollment.find(params[:id])
    end

    def new
      @enrollment = Enrollment.new
      @cohort     = Cohort.find(params[:cohort_id])
    end

    def create
      @cohort = Cohort.find(params[:cohort_id])
      @enrollment = @cohort.enrollments.new(params[:enrollment])
      if @enrollment.save
        redirect_to @cohort, notice: "Logged in!"
      else
        render :action => 'new'
      end
    end


    def edit
      @enrollment = Enrollment.find(params[:id])
    end

    def update
      @enrollment = Enrollment.find(params[:id])
      if @enrollment.update_attributes(params[:enrollment])
        redirect_to @enrollment, :notice  => "Successfully updated enrollment."
      else
        render :action => 'edit'
      end
    end

    def destroy
      @enrollment = Enrollment.find(params[:id])
      @enrollment.destroy
      redirect_to enrollments_url, :notice => "Successfully destroyed enrollment."
    end
  end