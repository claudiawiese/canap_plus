class ProfilsController < ApplicationController


  def show

  end

  def dashboard
    @reservations = current_user.reservations
    @events = current_user.events
  end

end
