require 'board'
class Game
  INSTRUCTIONS = 'guess the secret code:'.freeze
  VICTORY_MSG = 'Congratulations! You broke the code!'.freeze
  FAILURE_MSG = 'Aw, maybe next time'.freeze
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
      break if guess == @code

      @round += 1
    end
  end

  def get_guess
    gets.chomp.chars.map { |char| char.to_i }
  end
end
