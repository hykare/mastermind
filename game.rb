require 'board'
class Game
  INSTRUCTIONS = 'guess the secret code:'
  attr_reader :board, :rounds_left

  def initialize
    @board = Board.new
    @rounds_left = 12
    @code = Array.new(4).map { rand(1..6) }
  end

  def play
    while rounds_left > 0
      puts "round #{13 - rounds_left}"
      board.draw
      puts INSTRUCTIONS
      get_guess
      @rounds_left -= 1
    end
  end

  def get_guess
    gets.chomp.split
  end
end
