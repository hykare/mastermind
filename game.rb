require 'board'
class Game
  INSTRUCTIONS = 'guess the secret code:'
  TOTAL_ROUNDS = 12
  attr_reader :board, :round

  def initialize
    @board = Board.new
    @round = 0
    @code = Array.new(4).map { rand(1..6) }
  end

  def play
    while round < TOTAL_ROUNDS
      puts "round #{round}"
      board.draw
      puts INSTRUCTIONS
      guess = get_guess
      board.update(guess, round)
      @round += 1
    end
  end

  def get_guess
    gets.chomp.chars.map { |char| char.to_i }
  end
end
