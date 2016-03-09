post "/cards" do
  @card = Card.create(params[:card])
  deck = Deck.find_by(id: params[:deck_id])
  deck.cards << @card

  erb :"cards/_new_card_ajax", layout: false
end
