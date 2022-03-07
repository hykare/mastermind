require 'board'

class Game
  TOTAL_ROUNDS = 12
  attr_reader :board, :round, :secret_code

  def initialize
    @board = Board.new
    @round = 0
    @secret_code = make_code
  end

  def play
    print 'pssst! the secret code is ', secret_code, "\n\n"
    while round < TOTAL_ROUNDS
      puts "round #{round + 1}"
      board.draw(round)
      prompt_msg
      guess = get_guess
      key = make_key(guess)
      board.update(guess, key, round)
      break if guess == secret_code

      @round += 1
    end
  end

  def final_screen
    board.draw(round)
    failure_msg if round == TOTAL_ROUNDS
    victory_msg if round < TOTAL_ROUNDS
  end

  def get_guess
    input_code
  end

  def input_code
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

  def make_key(guess)
    local_code = secret_code.clone # prevents deleting from original
    correct_no = 0
    value_correct_no = 0
    key = []
    # checks for exact matches in both value and position
    guess.each_with_index do |peg, i|
      next unless peg == local_code[i]

      correct_no += 1
    end
    # checks for matches in value regardless of position
    guess.each do |peg|
      next unless local_code.include? peg

      local_code.delete_at(local_code.index(peg))
      value_correct_no += 1
    end
    correct_no.times { key << '●' }
    (value_correct_no - correct_no).times { key << '○' }
    key
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
    input_code
  end
end
