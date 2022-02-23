class Board
  attr_accessor :guesses, :hints

  def initialize
    @guesses = Array.new(12) { Array.new(4) }
    @hints = Array.new(12) { [] }
  end

  def draw
    guesses.each { |guess| print guess, "\n" }
  end

  def update(guess, round)
    guesses[round] = guess
  end
end
