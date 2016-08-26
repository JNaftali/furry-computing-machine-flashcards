#see list of decks
get '/decks' do
  @decks = Deck.all
  erb:'decks/index'
end

get '/decks/:id' do
  @round = Round.new[deck_id: params[:id]]
  @round.cards_left = Card.find_by(deck_id: params[:id])
  @round.save
  session[:round_id] = @round.id
  @card = card.first
  redirect '/card/#{card.id}'
end

get '/card/:id' do
  @round = round.find_by[id: session[:round_id]]
  @card = card.find_by[id: params[:id]]
  @deck = deck.find_by[id: @round.deck_id]


end
