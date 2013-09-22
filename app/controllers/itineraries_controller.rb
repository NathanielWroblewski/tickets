class ItinerariesController < ApplicationController

  def index

  end

  def show
    current_user = User.new # delete me
    if current_user.itineraries.first
      @itinerary = current_user.itineraries.first
    else
      @itinerary = current_user.itineraries.build
    end
  end

  def save_lat_long
    lat = params[:lat].to_f
    long = params[:long].to_f
    render nothing: true
  end

end
