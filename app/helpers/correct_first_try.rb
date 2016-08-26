def correct_first_try(round)
  correct_first_try_count = round.cards.reduce(0) do |total, card|
    card_guesses = round.guesses.select {|guess| guess.card_id == card.id }
    if card_guesses.length == 1
      total + 1
    else
      total
    end
  end
  correct_first_try_count.to_s
end
