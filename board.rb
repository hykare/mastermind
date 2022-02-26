class Board
  attr_accessor :guesses, :keys

  def initialize
    @guesses = Array.new(12) { Array.new(4, '_') }
    @keys = Array.new(12) { [] }
  end

  def draw(round)
    guesses.each_with_index do |guess, i|
      if i == round
        print ' > '
      else
        print '   '
      end

      guess.each { |peg| print peg, ' ' }
      print '  '
      keys[i].each { |key| print key, ' ' }
      print "\n"
    end
  end

  def update(guess, round, code)
    guesses[round] = guess
    update_keys(round, code)
  end

  def update_keys(round, code)
    code = code.clone # prevents deleting from original code array
    guess = guesses[round] # for readability
    correct_no = 0
    value_correct_no = 0
    # checks for exact matches in both value and position
    guess.each_with_index do |peg, i|
      next unless peg == code[i]

      correct_no += 1
    end
    # checks for matches in value regardless of position
    guess.each do |peg|
      next unless code.include? peg

      code.delete_at(code.index(peg))
      value_correct_no += 1
    end
    correct_no.times { keys[round] << '●' }
    (value_correct_no - correct_no).times { keys[round] << '○' }
  end
end
