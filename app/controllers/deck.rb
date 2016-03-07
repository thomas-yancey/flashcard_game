get "/decks" do
  @decks = Deck.all
  erb :"decks/index"
end


get "/decks/new" do
  redirect "/" unless logged_in?
  erb :"decks/new"
end

post "/decks" do
  @deck = Deck.create(user_id: session[:user], name: params[:name])
  redirect "/decks/#{@deck.id}/cards/new"
end

get "/decks/:id/cards/new" do
  binding.pry
  redirect "/" unless logged_in?
  @deck = Deck.find_by(id: params[:id])
  erb :"cards/new"
end

get "/decks/:id/edit" do
  # binding.pry
  @deck = Deck.find_by(id: params[:id])
  redirect "/" unless @deck.user_id == session[:user]

  erb :"/decks/edit"
end



get "/decks/:id" do
  @deck = Deck.find_by(id: params[:id])
  erb :"decks/show"
end
