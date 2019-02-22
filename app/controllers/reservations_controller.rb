class ReservationsController < ApplicationController



  def new
    # we need @event in our `simple_form_for`
    @event = Event.find(params[:event_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    # we need `event_id` to asssociate reservation with corresponding event
    @event = Event.find(params[:event_id])
    @reservation.event = @event
    @reservation.user = current_user

    available_seats = @event.capacity - @event.reservations.reduce(0) { |sum, res|
      sum + res.quantity
    }
    if @reservation.quantity <= available_seats
      if @reservation.save
        flash[:alert] = nil
        flash[:notice] = "Merci de votre réservation"
        redirect_to event_path(@event)
      else
        render :new
      end
    else
      flash[:alert] = "Il ne reste que #{available_seats} places disponibles"
      render :new
    end
  end

  def edit
    @reservation = Reservation.find params[:id]
    @reservation.save
  end

  def update
    @reservation = Reservation.find params[:id]
    @event = Event.find(params[:event_id])
    @reservation.event = @event
    @reservation.update
    redirect_to event_path(@event)
  end

  def delete
    @reservation = Reservation.find params[:id]
    @event = Event.find(params[:event_id])
    @reservation.delete
    redirect_to event_path(@event)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:quantity)
  end
end
