class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.datetime :when
      t.string  :title
      t.string :description
      t.string :blog_url
      t.string :location
      t.references :itinerary
    end
  end
end
