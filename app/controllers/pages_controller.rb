class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
    # Code pour la page d'accueil
  end

  def dashboard
    @vans = current_user.vans
  end
end
