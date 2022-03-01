require 'board'
class Game
  INSTRUCTIONS = 'guess the secret code:'.freeze
  VICTORY_MSG = 'Congratulations! You broke the code!'.freeze
  FAILURE_MSG = 'Aw, maybe next time'.freeze
  TOTAL_ROUNDS = 12
  attr_reader :board, :round, :code

  def initialize
    @board = Board.new
    @round = 0
    @code = Array.new(4).map { rand(1..6) }
  end

  def play
    print 'pssst! the secret code is ', code, "\n\n"
    while round < TOTAL_ROUNDS
      puts "round #{round + 1}"
      board.draw(round)
      puts INSTRUCTIONS
      guess = get_guess
      board.update(guess, round, code)
      break if guess == code

      @round += 1
    end
  end

  def final_screen
    board.draw(round)
    puts FAILURE_MSG if round == TOTAL_ROUNDS
    puts VICTORY_MSG if round < TOTAL_ROUNDS
  end

  def get_guess
    guess_valid = false
    input = []
    until guess_valid
      input = gets.chomp.chars.map { |char| char.to_i }
      length_valid = input.length == 4
      content_valid = input.all? { |digit| digit.between?(1, 6) }
      guess_valid = length_valid && content_valid
      puts 'invalid input' if !guess_valid
    end
    input
  end
end
