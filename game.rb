# game

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

class Game
  attr_accessor :which_turn
  attr_reader :player1, :player2

  @which_turn = ''

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    no_winner = true
    whos_turn = turn?('')
    while no_winner
      if @player1.lives != 0 && @player2.lives != 0 # Either player dead? If not, keep playing
        puts "P1: #{@player1.lives}/3 VS. P2: #{@player2.lives}/3"
        puts "----- NEW TURN -----"
        ask, actual = question # get the question and correct answer
        puts "#{whos_turn}: #{ask}" # ask the appropriate player
        print "> "
        if whos_turn === @player1.name
          answer = gets.chomp
          check_answer(@player1, answer, actual)
          whos_turn = turn?(@player1)
        else
          answer = gets.chomp
          check_answer(@player2, answer, actual)
          whos_turn = turn?(@player2)
        end
      else # Some one lost, end game
        if @player1.lives === 0
          puts "----- NEW TURN -----"
          puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
        else
          puts "----- NEW TURN -----"
          puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
        end
        puts "----- GAME OVER -----"
        puts "Good Bye!"
        no_winner = false
      end
    end
  end

  def turn?(player) # switch player turn
    if player === ''
      @which_turn = @player1.name
    elsif player.name === @player1.name
      @which_turn = @player2.name
    else
      @which_turn = @player1.name
    end
    @which_turn
  end

  def question # create question
    num1 = (rand * 10).floor
    num2 = (rand * 10).floor
    return "What's #{num1} plus #{num2}?", num1 + num2
  end

  def check_answer(player, answer, actual) # player answer correctly?
    if(answer.to_i != actual)
      puts "...Nope. Good try, tho!"
      player.updateLives(true)
    else
      puts "Nice one!"
    end
  end


end

player1 = Player.new()
player2 = Player.new()

game = Game.new(player1,player2)


game.start