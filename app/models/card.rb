class Card < ActiveRecord::Base
  has_many :deck_cards
  has_many :guesses

  validates :question, uniqueness: true
end
