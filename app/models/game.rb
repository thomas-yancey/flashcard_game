class Game < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user

  has_many :guesses
  has_many :deck_cards, through: :deck
  has_many :cards, through: :deck_cards
end
