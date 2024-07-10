class VansController < ApplicationController
  before_action :set_van, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @vans = Van.all
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
    @van.status = "available"
    if @van.save
      redirect_to @van, notice: 'Votre van est pret a vivre de belles aventures!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @van = Van.new(van_params)
    @van.user = current_user
    @van.status = "available"
    if @van.update(van_params)
      redirect_to @van, notice: 'Votre van est beaux comme un camion'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @van.destroy
    redirect_to vans_url, notice: 'Votre van est de retour au garage'
  end

  private

  def set_van
    @van = Van.find(params[:id])
  end

  def van_params
    params.require(:van).permit(:title, :description, :price_per_day, :location, :photos)
  end
end
