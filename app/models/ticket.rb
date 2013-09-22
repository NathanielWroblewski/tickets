class Ticket < ActiveRecord::Base
  belongs_to :itinerary

  attr_accessible \
    :title,
    :when,
    :where,
    :description,
    :blog_url,
    :location,
    :photo

  has_attached_file :photo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  def self.at_locations(locations)
  	tickets_at_location = []
		locations.each do |location|
			tickets_at_location << Ticket.where(location: location).to_a
		end
		tickets_at_location
  end
end
