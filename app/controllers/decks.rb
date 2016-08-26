#see list of decks
get '/decks' do
  @decks = Deck.all
  erb:'decks/index'
end

get '/decks/:id' do
  @round = Round.new(deck_id: params[:id])
  @round.save
  session[:round_id] = @round.id
  card = @round.draw_card
  redirect '/cards/#{card.id}'
end

get '/cards/:id' do
  @round = round.find_by[id: session[:round_id]]
  @card = card.find_by[id: params[:id]]
  @deck = deck.find_by[id: @round.deck_id]

  redirect '/cards/#{card.id}'
end
