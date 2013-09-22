# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

20.times do |i|

  User.create(
              username: Faker::Internet.user_name,
              email: Faker::Internet.email,
              password: Faker::Internet.password
              )
  

  parameters = ActionController::Parameters.new(title: Faker::Lorem.sentence(word_count = 6),
  user_id: i+1)
  Itinerary.create(parameters.permit(:title, :user_id))

end

100.times do

parameters = ActionController::Parameters.new(
                :when => Time.now + (rand(20) * 1000),
                title: Faker::Lorem.sentence(word_count = 4),
                description: Faker::Lorem.paragraph(sentence_count = 1),
                blog_url: Faker::Internet.url,
                location: Faker::Address.city + ", " + Faker::Address.country,
                itinerary_id: rand(20)
                )

  Ticket.create(parameters.permit(:when, :title, :description, :blog_url, :location, :itinerary_id))

end
