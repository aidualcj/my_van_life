class VansController < ApplicationController
  before_action :set_van, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @vans = Van.all
    if params[:query].present?
      @vans = @vans.where("location ILIKE ?", "%#{params[:query]}%")
    end
    if params[:dates].present?
      dates = params[:dates].split(" ")
      start_date_calendar = dates[0].to_date
      end_date_calendar = dates.last.to_date

      overlapping_bookings = Booking.where("start_date <= ? AND end_date >= ?", end_date_calendar, start_date_calendar)
      booked_van_ids = overlapping_bookings.pluck(:van_id)
      @vans = @vans.where.not(id: booked_van_ids)
    end
    @markers = @vans.geocoded.map do |van|
      {
        lat: van.latitude,
        lng: van.longitude
      }
    end
  end

  def show
    # @van est défini par set_van
  end

  def new
    @van = Van.new
  end

  def create
    @van = Van.new(van_params)
    @van.user = current_user
    @van.status = "disponible"
    if @van.save
      redirect_to @van, notice: 'Votre van est pret a vivre de belles aventures!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @van.user = current_user
    @van.status = "disponible"
    if @van.update(van_params)
      redirect_to @van, notice: 'Votre van est beaux comme un camion'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    raise
    @van.destroy
    redirect_to my_vans_path, notice: 'Votre van est de retour au garage'
  end

  def my_vans
    @vans = current_user.vans
  end

  def reservations
    @reservations = van_reservations
  end

  def van_reservations
    Booking.joins(:van).where(vans: { user_id: current_user.id }).distinct
  end

  def accept
    @reservation = van_reservations.find(params[:booking_id])
    @booking = Booking.find(params[:booking_id])
    @booking.update(status: "accepté")
    @reservation.update(status:"refusé")
    redirect_to my_van_reservations_path, notice: 'Réservation acceptée.'
  end

  def reject
    @reservation = van_reservations.find(params[:booking_id])
    @booking = Booking.find(params[:booking_id])
    @booking.update(status: "refusé")
    @reservation.update(status:"refusé")
    redirect_to my_van_reservations_path, notice: 'Réservation refusée.'
  end

  private

  def set_van
    @van = Van.find(params[:id])
  end

  def van_params
    params.require(:van).permit(:title, :description, :price_per_day, :location, :photos)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
 end
