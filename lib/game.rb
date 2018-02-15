class Game
  attr_accessor :random_number,
                :guess

  def initialize
    @random_number = rand(1..100)
    @guess = nil
  end

  def feedback
    if guess == random_number
      "Correct"
    elsif guess > random_number
      "too high"
    else guess < random_number
      "too low"
    end 
  end

end
