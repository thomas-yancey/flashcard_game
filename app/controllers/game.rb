post '/games' do
  @game = Game.create(deck_id: params[:deck_id], user_id: session[:user])
  session[:game] = @game.id
  @curr_card = @game.next_card
  session[:curr_card] = @curr_card.id
  erb :"games/show"
end
get '/games' do
  @game = Game.find_by(id: session[:game])

  @curr_card = @game.next_card
  session[:curr_card] = @curr_card.id

  erb :"/games/show"
end

get "/games/stats" do
  erb :"games/stats"
end


post '/games/guesses' do
  curr_card = Card.find_by(id: session[:curr_card])
  guess = Guess.new

  guess.game_id = session[:game]
  guess.card_id = curr_card.id
  guess.save

  guess.status_flip(params[:guess], curr_card.answer)

  @game = Game.find_by(id: session[:game])
  if @game.game_over?
    redirect "/games/stats"
  else
    redirect "/games"
  end
end

# get "games/:id/cards/:id" do
#   binding.pry
#   @game = Game.find_by(params[])
# end
