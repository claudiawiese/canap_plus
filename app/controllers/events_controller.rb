class EventsController < ApplicationController
  def index
    @events = event.all
  end
end
