class Itinerary < ActiveRecord::Base
  belongs_to :user
  has_many :tickets

  def locations
  	locations = self.tickets.map(&:location)
  	locations.uniq!
  end
end
