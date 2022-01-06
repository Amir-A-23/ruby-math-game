require "./players.rb"
require "./questions.rb"
 
class Game
  attr_accessor :player1, :player2, :turn, :current_player

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @turn = 0
    @list_of_players = [@player1, @player2]
    @current_player = @player1
  end


  #turn format
  def start_game
    @question = Question.new
    @question.ask_player(@current_player.name)
    @current_player.answer = gets.chomp.to_i
    if @current_player.answer == @question.correct_answer
      puts "Yes! You are correct!"
      new_turn
    else
      puts "Seriously? No! It's #{@question.correct_answer}"
      @current_player.lose_life
      new_turn
    end
  end

  #next turn
  def new_turn
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    game_over?
    puts "----- NEW TURN -----"
   switch_turns
   start_game
  end

  #game over
  def game_over?
    if @current_player.lives == 0
      switch_turns
      puts "#{@current_player.name} wins with a score of #{@current_player.lives}/3"
      puts "------- GAME OVER ---------"
      exit(0)
    end
  end

  #switch turns and current player
  def switch_turns
    @turn += 1
    @current_player = @list_of_players[@turn % 2]
  end
end