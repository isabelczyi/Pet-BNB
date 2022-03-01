class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :pet_id, :check_in, :check_out, :status)
  end
end
