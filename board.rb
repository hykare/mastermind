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
    correct_keys = []
    guesses[round].each_with_index do |peg, i|
      correct_keys << 'o' if peg == code[i]
    end
    keys[round] = correct_keys
  end
end
