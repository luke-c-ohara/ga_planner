class BookingsController < ApplicationController

    def index
      @bookings = Booking.all
    end

    def show
      @booking = Booking.find(params[:id])
    end

    def new
      @booking = Booking.new
    end

    def create
      @booking = Booking.new(params[:booking])
      if @booking.save
        redirect_to @booking, :notice => "Successfully created booking."
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