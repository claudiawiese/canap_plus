class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @events = Event.last(10)
  end
end
