class User < ActiveRecord::Base
  has_many :itineraries

  attr_accessible :username, :email, :password

end
