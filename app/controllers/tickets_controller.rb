class TicketsController < ApplicationController

  def create
    Ticket.create(params[:ticket])
  end

end
