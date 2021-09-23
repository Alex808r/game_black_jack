require_relative 'card'

class Deck

  attr_accessor :full_deck

  def initialize
    @full_deck = []
    create_random_deck
    @full_deck.shuffle!
  end

  def create_random_deck
    Card::CARD_SCORES.each do |rank, score|
      Card::CARD_SUITS.each do |suit|
        @full_deck.push(Card.new(rank,suit,score))
      end
    end
  end

end

d = Deck.new
p d

d.create_random_deck
x = d.full_deck
y = x.each{|card| print card.rank; print card.suit}
y.shuffle!
p y