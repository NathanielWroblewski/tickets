class ItinerariesController < ApplicationController

  def index

  end

  def show

  end

  def save_lat_long
    lat = params[:lat].to_f
    long = params[:long].to_f
    render nothing: true
  end

end
