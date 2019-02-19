class EventsController < ApplicationController
   skip_before_action :authenticate_user!, only: :index
  def index
    @events = Event.where("game ILIKE ?", "%#{params[:game]}%")
  end
end
