class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  has_many :guesses
  has_many :cards, through: :deck

  def finished_cards
    result = []
    self.guesses.each do |guess|
      if guess.correct?
        result << guess.card
      end
    end
    result
  end

  def draw_card
    (self.cards - self.finished_cards).sample
  end
end
