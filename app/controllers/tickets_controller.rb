class TicketsController < ApplicationController

  def create
    ticket = Ticket.new(params[:ticket])
    if ticket.save
      current_user.itineraries.first.tickets << ticket
      render json: {
        title: ticket.title,
        location: ticket.location,
        description: ticket.description
      }
    else
      render json: { error: 'There was a problem saving your event.' }
    end
  end

end
