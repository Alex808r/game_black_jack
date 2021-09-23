class Card

  attr_accessor :rank, :suit,:score

  CARD_SCORES = {
    '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
    '8' => 8, '9' => 8, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10,
    'A' => 11
  }

  CARD_SUITS = %w[крести буби черви вини]

  def initialize(rank, suit, score)
    @rank = rank
    @suit = suit
    @score = score
  end

  def random_card
    @rank = CARD_SCORES.to_a.sample[0]
    @suit = CARD_SUITS.sample
    @score = CARD_SCORES.to_a.sample[0]
  end

end

# card = Card.new('1','2','3')
# p card
#
# card.random_deck
# p card

# card.random_card
# p card