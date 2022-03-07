require 'board'

class Game
  TOTAL_ROUNDS = 12
  attr_reader :board, :round, :code

  def initialize
    @board = Board.new
    @round = 0
    @code = make_code
  end

  def play
    print 'pssst! the secret code is ', code, "\n\n"
    while round < TOTAL_ROUNDS
      puts "round #{round + 1}"
      board.draw(round)
      prompt_msg
      guess = get_guess
      board.update(guess, round, code)
      break if guess == code

      @round += 1
    end
  end

  def final_screen
    board.draw(round)
    failure_msg if round == TOTAL_ROUNDS
    victory_msg if round < TOTAL_ROUNDS
  end

  def get_guess
    guess_valid = false
    input = []
    until guess_valid
      input = gets.chomp.chars.map { |char| char.to_i }
      length_valid = input.length == 4
      content_valid = input.all? { |digit| digit.between?(1, 6) }
      guess_valid = length_valid && content_valid
      puts 'invalid input' unless guess_valid
    end
    input
  end

  def prompt_msg
    puts 'guess the secret code:'
  end

  def victory_msg
    puts 'Congratulations! You broke the code!'
  end

  def failure_msg
    puts 'Aw, maybe next time'
  end

  def make_code
    Array.new(4).map { rand(1..6) }
  end

end

class GameAsCodeMaker < Game
  # copy-pasted from make_code
  def get_guess
    gets # stops play loop from going to the next round immediately
    Array.new(4).map { rand(1..6) }
  end

  def prompt_msg
    puts 'next round (enter)'
  end

  def victory_msg
    puts 'The computer has broken the code!'
  end

  def failure_msg
    puts 'The computer has run out of guesses'
  end

  # copy-pasted from get_guess
  def make_code
    puts 'What is the secret code?'
    code_valid = false
    input = []
    until code_valid
      input = gets.chomp.chars.map { |char| char.to_i }
      length_valid = input.length == 4
      content_valid = input.all? { |digit| digit.between?(1, 6) }
      code_valid = length_valid && content_valid
      puts 'invalid input' unless code_valid
    end
    input
  end
end