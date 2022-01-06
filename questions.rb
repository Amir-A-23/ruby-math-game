class Question
  attr_accessor :correct_answer
  def initialize
    @first_number = rand(10)
    @second_number = rand(10) 
  end

  def ask_player(player)
    print "#{player}: What does #{@first_number} + #{@second_number} equal? "

    @correct_answer = (@first_number + @second_number)
  end
end