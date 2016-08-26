class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  has_many :guesses
  has_many :cards, through: :deck

  # def correct_first_guesses
  #   self.guesses.group(:card_id).count { |guess|  && guess.correct? }
  # end


end
