require 'bcrypt'

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password_hash, presence: true

  has_many :decks
  has_many :games
  has_many :guesses, through: :cards

  def all_games_played
    Game.where(user_id: self.id).pluck(:id)
  end

  def all_stats
    all_stats = self.all_games_played.map do |game_id|
      Game.find(game_id).stats_hash
    end
    all_stats
  end

  include BCrypt
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
