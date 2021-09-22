require_relative 'player'

class Interface

  def initialize
    @players = []
  end

  def main_menu
    loop do
      print "Введите команду=>: "
      choice = gets.strip.to_i
      case choice
      when 0 then break
      when 1 then create_player
      end
    end
  end

  def create_player
    print "Введите имя пользователя: "
    @players.push(Player.new(gets.chomp))
  end

end

Interface.new.main_menu