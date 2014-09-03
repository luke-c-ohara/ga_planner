class BookingsController < ApplicationController

    def index
      @bookings = Booking.all
    end

    def show
      @booking = Booking.find(params[:id])
    end

    def new
      @booking = Booking.new
      @classroom    = Classroom.find(params[:classroom_id])
    end

    def create
      @classroom = Classroom.find(params[:classroom])
      @booking = @classroom.bookings.new(params[:classroom])
      if @booking.save
        redirect_to @classroom, :notice => "Successfully created booking."
      else
        render :action => 'new'
      end
    end

    def edit
      @booking = Booking.find(params[:id])
    end

    def update
      @booking = Booking.find(params[:id])
      if @booking.update_attributes(params[:booking])
        redirect_to @booking, :notice  => "Successfully updated booking."
      else
        render :action => 'edit'
      end
    end

    def destroy
      @booking = Booking.find(params[:id])
      @booking.destroy
      redirect_to bookings_url, :notice => "Successfully destroyed booking."
    end
  end