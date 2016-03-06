class Deck < ActiveRecord::Base
  has_many :deck_cards
  has_many :games
  has_many :cards, through: :deck_cards
end