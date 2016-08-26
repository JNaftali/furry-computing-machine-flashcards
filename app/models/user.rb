class User < ActiveRecord::Base
  has_secure_password

  has_many :rounds
  has_many :decks, through: :rounds
end
