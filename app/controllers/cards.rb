post '/cards/:id' do
  @guess = Guess.create(guess_text: params[:guess], round_id: session[:round_id], card_id: params[:id])
  @round = Round.find(session[:round_id])
  # binding.pry
  if @round.finished_cards.length == @round.cards.length
    redirect "/decks/:id/statistics"
  else
    path = "/decks/#{@round.deck_id}"
    path += "?correct_answer=#{@guess.card.answer}" unless @guess.correct?
    redirect path
  end
end
