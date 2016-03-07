class Guess < ActiveRecord::Base
  belongs_to :game
  belongs_to :card

  def status_flip(guess, curr_card_answer)
    self.update_attributes(status: true) if correct_guess(guess, curr_card_answer)
  end

  def correct_guess(guess, answer)
    canonical(answer) == canonical(guess)
  end

end
