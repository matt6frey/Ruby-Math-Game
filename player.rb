# Player Class

class Player
  attr_accessor :num_of_players, :lives
  attr_reader :name

  @@num_of_players = 0

  def initialize()
    @@num_of_players += 1
    puts "What's your name player #{@@num_of_players}?"
    @name = gets.chomp
    @lives = 3
  end

  def updateLives(wrongAnswer)
    if(wrongAnswer)
      @lives -= 1
    end
  end


end