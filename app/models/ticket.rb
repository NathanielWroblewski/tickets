class Ticket < ActiveRecord::Base
  belongs_to :itinerary

  attr_accessible \
    :title,
    :when,
    :where,
    :description,
    :blog_url,
    :location
end
