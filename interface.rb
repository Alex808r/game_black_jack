class Interface

  attr_accessor :player, :bank, :deck, :round_number, :choice

  BET = 10
  NO_MONEY = "\nNo money, no honey"
  GAME_OVER = "\nGame over"

  def initialize
    @round_number = 1
  end

  def game_over
    puts GAME_OVER
  end

  def clear_hands(player, dealer)
    player.hand.clear_hand
    dealer.hand.clear_hand
  end

  def info(player, dealer)
    puts "#{'*' * 25}"
    puts "Раунд № #{@round_number}"
    puts "#{player.name} —  #{player.player_money}"
    puts "#{dealer.name} —  #{dealer.player_money}"
    puts "#{'*' * 25}"
    @round_number += 1
  end

  def player_bet(player)
    #player.bank -= BET
    player.bank -= Bank::STANDARD_BET
  end

  def start_bet(player, dealer, bank)
    bank.first_bet(player, dealer)
  end

  def auto_deal(player, dealer, deck)
    2.times do
      player.hand.get_card(deck.draw_card)
      dealer.hand.get_card(deck.draw_card)
    end
  end

  def players_hand(player)
    puts "\nВаши карты: "
    player.hand.cards do |c|
      puts "#{c.rank}#{c.suit.encode('utf-8')}"
    end
    puts "Всего очков: #{player.hand.scores}"
  end

  def dealer_hand(dealer)
    puts "Карты дилера: "
    dealer.hand.cards do |c|
      puts "#{c.rank}#{c.suit.encode('utf-8')}"
    end
    puts "Всего очков: #{dealer.hand.scores}"
  end

  def dealer_hand_hidden(dealer)
    puts "\nКарты дилера закрыты: "
    dealer.hand.cards.size.times { puts 'X' }
  end

  def player_turn(player, deck)
    puts "\n1. Пропустить ход\n2. Взять карту\n3. Открыть карты"
    choice = gets.strip.to_i

    case choice
    when 1 then nil
    when 2 then player.hand.get_card(deck.draw_card)
    when 3 then @game_over = true
    end
  end

  def dealer_turn(dealer, deck)
    dealer.hand.get_card(deck.draw_card) if dealer.hand.scores < 17 && dealer.hand.cards.size < 3
  end

  def no_money(player, dealer)
    player.player_money.zero? || dealer.player_money.zero?
  end

  def game_results(dealer, player, bank)
    puts "#{'*' * 25}"
    if (dealer.hand.scores > player.hand.scores) && (dealer.hand.scores <= 21)
      bank.winner(dealer)
      puts  '     Вы проиграли'
    elsif (dealer.hand.scores <= 21) && (player.hand.scores > 21)
      bank.winner(dealer)
      puts '     Вы проиграли'
    elsif player.hand.scores > 21 && dealer.hand.scores > 21
      puts '    Никто не выйграл'
    elsif dealer.hand.scores == player.hand.scores && dealer.hand.scores <= 21
      bank.draw(player, dealer)
      puts '       Ничья'
    elsif player.hand.scores <= 21
      bank.winner(player)
      puts 'Поздравляем, Банк Ваш!'
    end
    puts "#{'*' * 25}"
  end

end

