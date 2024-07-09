class ReviewsController < ApplicationController
  before_action :set_booking, only: [:new, :create]

  def new
    @review = @booking.reviews.new
  end

  def create
    @review = @booking.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to van_path(@booking.van), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :booking_id, :user_id)
  end
end
