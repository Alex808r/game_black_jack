# frozen_string_literal: true

class Player
  attr_accessor :cards, :bank, :hand, :player_money
  attr_reader :total_scores, :name

  def initialize(name)
    @name = name
    @player_money = 100
    @hand = Hand.new
  end

  def bet_on(_money)
    @player_money -= 10
  end

  def win(bank)
    @player_money += bank
  end
end
