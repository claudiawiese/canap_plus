class EventsController < ApplicationController
   skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @events = Event.where.not(latitude: nil, longitude: nil)

    if params[:game].present?
      @events = @events.search_by_game(params[:game])
      if params[:address].present?
        @events = @events.near(params[:address],20)
      end
    elsif params[:address].present?
      @events = @events.near(params[:address],20)
    end
    @markers = @events.map do |event|
      {
        lng: event.longitude,
        lat: event.latitude
      }
    end
  end

  def show
    @event = Event.find(params[:id])

    @available_seats = @event.capacity - @event.reservations.reduce(0) { |sum, res|
      sum + res.quantity
    }
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
      render :new
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
