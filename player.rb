class Player

  attr_accessor :name, :player_money

  def initialize(name)
    @name = name
    @player_money = 100
  end

  def bet_on(_money)
    @player_money -= 10
  end

  def win_round(bank)
    @player_money += bank
  end
end

