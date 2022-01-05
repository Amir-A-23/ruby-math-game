class Question

  def initialize
    @first_number = rand(100)
    @second_number = rand(100) 
  end

  def ask_player(Player)
    print "#{player.name}: What does #{@first_number} + #{@second_number} equal?"

    correct_answer = (get.chomp.to_i == @first_number + @second_number)
    
    if correct_answer
      puts "YES! You are correct.\n\n"
    else
      puts "Seriously? No!\n\n"
    end
    return correct_answer
  end
end