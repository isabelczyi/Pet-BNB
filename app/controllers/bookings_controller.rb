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
     @markers =[
      {
        lat: @booking.pet.latitude,
        lng: @booking.pet.longitude,
        info_window: render_to_string(partial: "info_window", locals: { pet: @booking.pet }),
        image_url: "http://res.cloudinary.com/dyr0u2nqe/image/upload/v1646310640/x9uhrgqmvof9apbjyrrg.png"
      }]
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking

  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
   if @booking.update(booking_params)
    redirect_to root_path
   else
    render :edit
   end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :pet_id, :check_in, :check_out, :status)
  end
end
