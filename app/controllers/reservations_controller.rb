class ReservationsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @reservation = Reservation.new
    @reservation.event = @event
    @reservation.user = current_user
    authorize @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    # we need `event_id` to asssociate reservation with corresponding event
    @event = Event.find(params[:event_id])
    @reservation.event = @event
    @reservation.user = current_user
    authorize @reservation
    @available_seats = @event.capacity - @event.reservations.reduce(0) { |sum, res|
      sum + res.quantity
    }
    if @reservation.save
      flash[:alert] = nil
      flash[:notice] = "Merci de votre réservation"
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @reservation.user = current_user
    authorize @reservation
  end

  def update
    @reservation = Reservation.find(params[:id])
    @event = @reservation.event
    @reservation.user = current_user
    authorize @reservation
    @quantity = reservation_params[:quantity]
    @available_seats = @event.capacity - @event.reservations.reduce(0) { |sum|
        sum + @quantity.to_i }
    if @reservation.update(reservation_params)
    flash[:alert] = nil
    flash[:notice] = "Votre réservation a été éditée"
    redirect_to event_path(@event)
    else
      render :edit
    end
  end


  def destroy
    @reservation = Reservation.find params[:id]
    authorize @reservation
    @reservation.delete
    redirect_to dashboard_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:quantity)
  end
end
