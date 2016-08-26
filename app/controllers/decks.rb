#see list of decks
get '/decks' do
  @decks = Deck.all
  session[:round_id] = nil
  erb:'decks/index'
end

get '/decks/:id' do
  if session[:round_id]
    @round = Round.find(session[:round_id])
    # binding.pry
    unless params[:id].to_i == @round.deck_id
      @round.destroy
      session[:round_id] = nil
    end
  end

  unless session[:round_id]
    @round = Round.new(deck_id: params[:id], user_id: session[:user_id])
    @round.save
    session[:round_id] = @round.id
  end

  @card = @round.draw_card
  erb :'decks/show'
end

get '/decks/:id/statistics' do
  @round = Round.find(session[:round_id])

  @correct_first_try_count = @round.cards.reduce(0) do |total, card|
    card_guesses = @round.guesses.select {|guess| guess.card_id == card.id }
    if card_guesses.length == 1
      total + 1
    else
      total
    end
  end
  session[:round_id] = nil
  erb :'decks/statistics'
end
