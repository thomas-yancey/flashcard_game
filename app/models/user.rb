require 'bcrypt'

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password_hash, presence: true

  has_many :decks
  has_many :games
  has_many :guesses, through: :cards


  include BCrypt
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
