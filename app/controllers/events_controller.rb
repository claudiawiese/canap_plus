class EventsController < ApplicationController
   skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @events = policy_scope(Event)
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
    @reservation = Reservation.find_by(event_id: @event.id, user_id: current_user.id)
    authorize @event
    @available_seats = @event.capacity - @event.reservations.reduce(0) { |sum, res|
      sum + res.quantity
    }
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find params[:id]
    authorize @event
    @event.save
  end

  def update
    @event = Event.find(params[:id])
    authorize @event
    @event.update(event_params)
    redirect_to event_path(@event)
  end


  def destroy
    @event = Event.find params[:id]
    authorize @event
    @event.destroy
    redirect_to dashboard_path
  end

  private

  def event_params
    params.require(:event).permit(:game, :date, :description, :address, :capacity, :fee, :photo, :photo_cache)
  end
end
