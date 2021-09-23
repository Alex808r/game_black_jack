class Card

  attr_accessor :rank, :suit, :scores

  CARD_SCORES = {
    '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
    '8' => 8, '9' => 8, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10,
    'A' => 11
  }

  # CARD_SUITS = %w[вини крести черви буби ]
  CARD_SUITS = %W[\u2660 \u2663 \u2665 \u2666]
  def initialize(rank, suit, scores)
    @rank = rank
    @suit = suit
    @scores = scores
  end

  def random_card
    @rank = CARD_SCORES.to_a.sample[0]
    @suit = CARD_SUITS.sample.encode('utf-8')
    @scores = CARD_SCORES.to_a.sample[1]
  end

end
#
# card = Card.new('1','2','3')
# p card
#
# card.random_card
# p card

# card.random_card
# p card