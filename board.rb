class Board
  attr_accessor :guesses, :keys

  def initialize
    @guesses = Array.new(12) { Array.new(4) }
    @keys = Array.new(12) { [] }
  end

  def draw
    guesses.each_with_index { |guess, i| print guess, keys[i], "\n" }
  end

  def update(guess, round)
    guesses[round] = guess
  end
end
