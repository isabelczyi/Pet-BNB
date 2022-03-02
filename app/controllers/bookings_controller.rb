class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Pet).order(created_at: :desc)
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @pet = Pet.find(params[:pet_id])
    @booking.pet = @pet
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :pet_id, :check_in, :check_out, :status)
  end
end
