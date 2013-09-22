class RecommendationsController < ApplicationController

	include RecommendationsHelper

  def index
  	if current_user.itineraries.last.tickets.size < 3
  		render '/recommendations/index'
    else
    	redirect_to '/recommendations/show'
    end
  end

  def show
    @recommendations = get_recommendations(current_user.itineraries.last)
  end

  def tickets_by_location
  	@tickets = Ticket.where(location: params[:destination])
  	render :_simple_recommendations, layout: false
  end

  def search
    @results = Ticket.where("location LIKE '%#{params[destination]}%'")
    content_type :json
    {results: @results}.to_json
  end

end
