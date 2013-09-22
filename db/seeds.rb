# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

p 'Creating Users/Itineraries'
20.times do |i|
  @user = User.create(
              username: Faker::Internet.user_name,
              email: Faker::Internet.email,
              password: Faker::Internet.password
              )

  parameters = ActionController::Parameters.new(title: Faker::Lorem.sentence(word_count = 6),
                                                user_id: @user.id)
  Itinerary.create(parameters.permit(:title, :user_id))

end


def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/#{file_name}"))
end

p 'Adding Tickets'
100.times do

  parameters = ActionController::Parameters.new(
                :when => Time.now + (rand(20) * 1000),
                title: Faker::Lorem.sentence(word_count = 4),
                description: Faker::Lorem.paragraph(sentence_count = 1),
                blog_url: Faker::Internet.url,
                location: Faker::Name.last_name,
                itinerary_id: rand(20),
                photo: seed_image('background-0.png')
                )

  Ticket.create(parameters.permit(:when, :title, :description, :blog_url, :location, :itinerary_id, :photo))
 
# tickets.each do |attributes|
#   attributes[:photo] = 
#   Ticket.find(attributes[:id], attributes)
# end

end
