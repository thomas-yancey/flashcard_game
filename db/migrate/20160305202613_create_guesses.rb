class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :game
      t.references :card
    end
  end
end
