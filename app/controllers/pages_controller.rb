class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @events = Event.last(10)
  end

  def dashboard
    @reservations = current_user.reservations
    @events = current_user.events
  end

end
