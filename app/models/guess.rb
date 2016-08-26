class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card

  def correct?
    self.guess_text == self.card.answer
  end
end
