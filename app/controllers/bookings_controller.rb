class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  before_action :set_van, only: [:new, :create]
  before_action :authenticate_user!, only: [:new, :create, :show]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.van = @van
    @booking.user = current_user
    @booking.status = "attente"
    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = booking_path
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
