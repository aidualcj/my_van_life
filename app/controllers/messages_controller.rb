class MessagesController < ApplicationController
  before_action :set_booking, only: [:show, :new, :create]

  def index
    @messages = current_user.messages
  end

  def show
    @messages = @booking.messages
  end

  def new
    @message = @booking.messages.new
  end

  def create
    @message = @booking.messages.new(message_params)
    @message.user = current_user
    if @message.save
      redirect_to booking_messages_path(@booking), notice: 'Message was successfully sent.'
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content, :booking_id, :user_id)
  end
end
