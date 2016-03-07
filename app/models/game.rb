class Game < ActiveRecord::Base

  belongs_to :deck
  belongs_to :user
  has_many :guesses
  has_many :deck_cards, through: :deck
  has_many :cards, through: :deck_cards

  def game_over?
    available_cards.empty?
  end

  def next_card
    Card.find_by(id: available_cards.sample)
  end

  def true_cards
    Guess.where(status: true, game_id: self.id).pluck(:card_id)
  end

  def all_cards
    self.deck.cards.select("id").pluck("id")
  end

  def available_cards
    all_cards - true_cards
  end

end
