class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  has_many :guesses
  has_many :cards, through: :deck

  def finished_cards
    @finished_cards ||= []
  end

  def finished_cards=(thing)
    @finished_cards = thing
  end

  def draw_card
    (self.cards - self.finished_cards).sample
  end
end
