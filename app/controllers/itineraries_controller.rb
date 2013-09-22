class ItinerariesController < ApplicationController

  def index

  end

  def show
  	@user = current_user
    if current_user.itineraries.try(:first)
      @itinerary = current_user.itineraries.first
    else
      @itinerary = current_user.itineraries.create
    end
  end

  def save_lat_long
    lat = params[:lat].to_f
    long = params[:long].to_f
    location_info = {}

    # the api key is hardcoded in, i blame this on Nate
    response = HTTParty.post("http://www.geocodefarm.com/api/reverse/json/65caadac07b171d25d08af0153a382022f05129e/#{lat}/#{long}/")
    results = JSON.parse(response.body)['geocoding_results']['ADDRESS']['address']
    if results.include? "USA"
    	results = results.split(", ")
    	location_info[:city] = results[-3]
    	location_info[:region] = results[-2].split(" ")[0]
    elsif results.include? "United Arab Emirates"
    	results = results.split(", ")
    	location_info[:city] = results[-1].split(" - ")[-2]
    	location_info[:region] = "UAE"
    else
    	results = results.split(", ")
    	location_info[:city] = results[-2]
    	location_info[:region] = results[-1]
    end

    render json: location_info
  end

  def search_query
  	query = params['query'].sub(" ", "%20")
  	response = HTTParty.post("http://www.geocodefarm.com/api/forward/json/65caadac07b171d25d08af0153a382022f05129e/#{query}/")
    results = JSON.parse(response.body)['geocoding_results']['COORDINATES']

    render json: results
  end

end
