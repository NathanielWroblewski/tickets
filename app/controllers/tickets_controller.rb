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

  def update
    @ticket = Ticket.find(params[:id])

    # respond_to do |format|
      @ticket.update_attributes(params[:ticket])
      @ticket.save
      #   format.html { redirect_to '/itineraries/show' }
      redirect_to '/itineraries/show'
      #   format.json { head :no_content }
      # else
      #   format.html { render action: "edit" }
      #   format.json { render json: @ticket.errors, status: :unprocessable_entity }
      # end
    # end
  end

end
