class ReservationsController < ApplicationController
  def new
    # we need @event in our `simple_form_for`
    @event = Event.find(params[:event_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    # we need `event_id` to asssociate reservation with corresponding event
    @reservation.event = Event.find(params[:event_id])
    @reservation.user = current_user
    if @reservation.save
      redirect_to event_path(@event)
    else
      render 'event/show'
    end
  end

  def update_capacity
    if @reservation.save && (quantity < @event.capacity)
       @event.capacity -= quantity
       return @event.capacity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:quantity)
  end
end
