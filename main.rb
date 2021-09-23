require_relative 'player'
require_relative 'card'
require_relative 'deck'
require_relative 'bank'

class Main

  def initialize
    @bank = Bank.new
    @player = Player.new('Dealer')
    @deck = []
    create_player

  end

  def create_player
    print "Введите имя пользователя: "
    @player = Player.new(gets.strip.capitalize)
  end


end


