class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :game
      t.references :card
      t.boolean :status, default: false

      t.timestamps null: false
    end
  end
end
