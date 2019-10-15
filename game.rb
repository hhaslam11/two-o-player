class Game

  MAX_NUMBER_IN_QUESTION = 20

  attr_reader :question, :answer
  attr_accessor :winner

  def initialize(player1, player2)
    @player1  = player1
    @player2  = player2

    @question = ""
    @answer   = 0
    @winner   = nil
    @current_player = @player2
    next_turn()
  end

  def next_turn
    newQuestion
    @current_player = opposite_player(@current_player)
  end

  def correctAnswer?(answer)
    if @answer.to_s == answer.to_s then
      return true
    end
    false
  end

  def play
    while !@winner
      puts "__________________________________"
      puts "Player #{@current_player.number}'s turn"
      print @question
      
      #Get and check answer
      if correctAnswer?(gets.chomp)
        puts 'Correct!'
      else
        puts "Wrong. The answer was #{@answer}"
        @current_player.lives -= 1
      end
      
      #print score
      puts "P1: #{@player1.lives}/3 ~VS~ P2: #{@player2.lives}/3"

      # check if player is out of lives
      if @current_player.lives == 0
        @winner = opposite_player(@current_player)
      end

      next_turn
    end

    puts "\n\nThe winner is player #{@current_player.number}!"
  end

  private
  def newQuestion
    number1   = rand(MAX_NUMBER_IN_QUESTION) + 1
    number2   = rand(MAX_NUMBER_IN_QUESTION) + 1
    @answer   = number1 + number2
    @question = "What does #{number1} + #{number2} equal? "
  end

  def opposite_player(player)
    if player == @player1
      return @player2
    else
      return @player1
    end
  end

end