class RecommendationsController < ApplicationController
  
  def index
    @tickets = current_user.itineraries.first.tickets
  end

  def show

  end
end
