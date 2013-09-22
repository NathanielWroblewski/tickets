class TicketsController < ApplicationController

  def create
    p params
    ticket = Ticket.new(params[:ticket])
    if ticket.save
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
