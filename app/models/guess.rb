class Guess < ActiveRecord::Base
  belong_to :game
  belongs_to :card
end
