get '/' do
  if logged_in?
    redirect '/decks'
  else
    erb :index
  end
end
