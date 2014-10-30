class EnrollmentsController < ApplicationController
 load_and_authorize_resource
  def index
    @enrollments = Enrollment.all
  end

  def show
    @enrollment = Enrollment.find(params[:id])
  end

  def new
    @enrollment = Enrollment.new
    @cohort = Cohort.find(params[:cohort_id])
  end

  def create
    @cohort = Cohort.find(params[:cohort_id])
    #repeation L13
    @enrollment = @cohort.enrollments.new(params[:enrollment])
    @enrollment.user = current_user
    if @enrollment.save
      redirect_to @cohort, notice: "Created enrollment!"
    else
      render :action => 'new'
    end
  end


  def edit
    @enrollment = Enrollment.find(params[:id])
    #repeation L8
    authorize! :create, @enrollment
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