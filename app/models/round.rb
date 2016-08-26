class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  has_many :guesses
  has_many :cards, through: :deck

  def correct_first_guesses
    self.guesses.count { |guess| guess.first_guess && guess.correct? }
  end
end
