class CohortsController < ApplicationController
  load_and_authorize_resource
    def index
      @cohorts = Cohort.all
    end

    def show
      @cohort = Cohort.find(params[:id])
    end

    def new
      @cohort = Cohort.new
    end

    def create
      @cohort = Cohort.new(params[:cohort])
      if @cohort.save
        redirect_to @cohort, :notice => "Successfully created cohort."
      else
        render :action => 'new'
      end
    end

    def edit
      @cohort = Cohort.find(params[:id])
    end

    def update
      @cohort = Cohort.find(params[:id])
      if @cohort.update_attributes(params[:cohort])
        redirect_to @cohort, :notice  => "Successfully updated cohort."
      else
        render :action => 'edit'
      end
    end

    def destroy
      @cohort = Cohort.find(params[:id])
      @cohort.destroy
      redirect_to cohorts_url, :notice => "Successfully destroyed cohort."
    end
  end