class Itinerary < ActiveRecord::Base
  belongs_to :user
  has_many :tickets

  def locations
  	tickets.map(&:location).uniq
  end
end
