class Itinerary < ActiveRecord::Base
  belongs_to :user
  has_many :tickets

  attr_accessible :title

  def locations
  	tickets.map(&:location).uniq
  end
end
