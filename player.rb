class Player

  attr_accessor :name

  def initialize(name)
    @name = name
    @player_money = 100
  end

  def bet_on
    @player_money -= 10
  end

end

