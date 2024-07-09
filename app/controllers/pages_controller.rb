class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
    # Code pour la page d'accueil
    @user_signed_in = user_signed_in?
  end

  def dashboard
    @vans = current_user.vans
  end
end
