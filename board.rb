class Board
  attr_reader :guesses, :hints

  def initialize
    @guesses = Array.new(12) { Array.new(4) }
    @hints = Array.new(12) { [] }
  end

  def draw
    guesses.each { |guess| print guess, "\n" }
  end
end
