# frozen_string_literal: true

require_relative 'require'

class Main
  def initialize
    @bank = Bank.new
    @dealer = Player.new('Dealer')
    @deck = []
    create_player
    @interface = Interface.new
  end

  def create_player
    print "Введите имя пользователя: "
    @player = Player.new(gets.strip.capitalize)
  end

  def start_game
    loop do
      preparadness

      table_interface

      @interface.player_turn(@player, @deck)
      @interface.dealer_turn(@dealer, @deck) unless @game_over

      @interface.players_hand(@player)
      @interface.dealer_hand(@dealer)
      @interface.game_results(@dealer, @player, @bank)

      if @interface.no_money(@player, @dealer)
        print Interface::NO_MONEY
        break
      end

      print "\n1. Играть еще \n0. Выход\n"
      choice = gets.strip.to_i

      case choice
      when 1 then print "\nИграем"
      when 0 then break
      end
    end
    @interface.game_over
  end

  def preparadness
    @game_over = false

    @interface.clear_hands(@dealer, @player)

    @deck = Deck.new

    @interface.start_bet(@dealer, @player, @bank)
    @interface.auto_deal(@dealer, @player, @deck)
  end

  def table_interface
    @interface.info(@dealer, @player)

    @interface.players_hand(@player)
    @interface.dealer_hand_hidden(@dealer)
  end
end

Main.new.start_game
