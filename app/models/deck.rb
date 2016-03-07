class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :deck_cards
  has_many :games
  has_many :cards, through: :deck_cards

  def random_card
    available_cards
    self.cards.sample
  end

  def cards_ids
    self.cards.pluck(:id)
  end




end
# Guess.where(game_id: 25, card_id: 19, status: true)
