# frozen_string_literal: true

class Bank
  STANDARD_BET = 10
  attr_accessor :bank

  def initialize
    @bank = 0
  end

  def first_bet(player, dealer)
    player.bet_on(STANDARD_BET)
    dealer.bet_on(STANDARD_BET)
    @bank = STANDARD_BET * 2
  end

  def winner(player)
    player.win(@bank)
    @bank = 0
  end

  def draw(player, dealer)
    player.win(@bank / 2)
    dealer.win(@bank / 2)
    @bank = 0
  end

  def enough_money?(player, dealer)
    player.player_money > STANDARD_BET
    dealer.player_money > STANDARD_BET
  end
end
