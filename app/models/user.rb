class User < ActiveRecord::Base
  has_many :itineraries

  attr_accessible :username, :email, :password

  validates :username, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
