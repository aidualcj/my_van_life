class CheckingsController < ApplicationController
  before_action :set_booking, only: [:new, :create]

  def new
    @checking = @booking.checkings.new(checking_type: params[:checking_type])
  end

  def create
    @checking = @booking.checkings.new(checking_params)
    if @checking.save
      redirect_to van_path(@booking.van), notice: 'Checking was successfully created.'
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def checking_params
    params.require(:checking).permit(:status, :comments, :checking_type, :booking_id, :user_id)
  end
end
