class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  before_action :set_van, only: [:index, :new, :create]

  def index
    @bookings = @van.bookings
  end

  def new
    @booking = @van.bookings.new
  end

  def create
    @booking = @van.bookings.new(booking_params)
    if @booking.save
      redirect_to van_bookings_path(@van), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def edit
    # @booking est défini par set_booking
  end

  def update
    if @booking.update(booking_params)
      redirect_to van_bookings_path(@booking.van), notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to van_bookings_path(@booking.van), notice: 'Booking was successfully destroyed.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_van
    @van = Van.find(params[:van_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :van_id)
  end
end
