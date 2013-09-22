class Ticket < ActiveRecord::Base
  belongs_to :itinerary

  attr_accessible \
    :title,
    :when,
    :where,
    :description,
    :blog_url,
    :location

  def self.at_locations(locations)
  	tickets_at_location = []
		locations.each do |location|
			tickets_at_location << Ticket.where(location: location).to_a
		end
		tickets_at_location
  end
end
