decks = [ 'Nighthawk Trivia', 'Otter Trivia', 'Raccoon Trivia' ]

cards = [ [
  { question: 'What is a nighthawk\'s primary food source?', answer: 'insects' },
  { question: 'True or false?  Nighthawks are closely related to hawks.', answer: 'false' },
  { question: 'True or false?  Nighthawks make nests.', answer: 'false' },
  { question: 'Where do Common Nighthawks spend the winter?', answer: 'South America' },
  { question: 'True or false?  Bullbat is another name for the Common Nighthawk.', answer: 'true' }
],

[
  { question: 'What is an otter\'s primary food source?', answer: 'fish' },
  { question: 'True or false? Otters spend the majority of their time on land.', answer: 'true' },
  { question: 'How many species of otters are there?', answer: '13' },
  { question: 'True of false? Otters are native to Australia.', answer: 'false' },
  { question: 'True or false? Otters make and use tools.', answer: 'true' },
  { question: 'In years, what is the average life span of an otter in the wild?', answer: '10' }
],

[
  { question: 'What is a male raccoon called?', answer: 'boar' },
  { question: 'What is a female raccoon called?', answer: 'sow' },
  { question: 'Are raccoons herbivorous, carnivorous, or omnivorous?', answer: 'omnivorous' },
  { question: 'True or false?  Raccoons are nocturnal.', answer: 'true' },
  { question: 'True or false?  Raccoons hibernate.', answer: 'false' },
  { question: 'True or false?  Raccoons can run at speeds up to 15 miles per hour.', answer: 'true' }
]
]

decks.each_with_index do |name, index|
  new_deck = Deck.find_or_create_by( name: name )
  new_deck.cards.destroy_all
  new_cards = cards[index].map { |card| Card.new(card) }
  new_deck.cards = new_cards
end
