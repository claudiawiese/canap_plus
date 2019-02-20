class EventsController < ApplicationController

   skip_before_action :authenticate_user!, only: :index
  def index
    @events = Event.where.not(latitude: nil, longitude: nil)
    @markers = @events.map do |flat|
      {
        lng: flat.longitude,
        lat: flat.latitude
      }
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render 'event/show'
    end
  end

  # def edit
  #   @event = Event.find params[:id]
  #   @event.save
  # end

  # def update

  # end

  def destroy
    @event = Event.find params[:id]
    @event.destroy
    redirect_to user_path(@event.user)
  end

  private

  def event_params
    params.require(:event).permit(:game, :date, :description, :address, :capacity, :fee, :photo)
  end
end
