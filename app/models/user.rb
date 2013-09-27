class User < ActiveRecord::Base
  has_many :itineraries

  has_secure_password

  attr_accessible :username, :email, :password, :password_confirmation

  validates :username, uniqueness: true
  validates_presence_of :password, :on => :create
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
