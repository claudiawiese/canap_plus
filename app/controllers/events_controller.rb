class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = Event.new(event_params)
        # @dose.cocktail = @cocktail
    if @event.save
      redirect_to event_path(@event)
    else
      render 'event/show'
    end
  end

  def destroy
    @event = Event.find params[:id]
    @event.destroy
    redirect_to user_path(@event.user)
  end

  def edit
    @event = Event.find params[:id]
  end

  private

  def event_params
    params.require(:event).permit(:game, :date, :description, :address, :capacity, :fee)
  end
end
