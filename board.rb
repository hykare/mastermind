class Board
  attr_accessor :guesses, :keys

  def initialize
    @guesses = Array.new(12) { Array.new(4) }
    @keys = Array.new(12) { [] }
  end

  def draw
    guesses.each_with_index { |guess, i| print guess, keys[i], "\n" }
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
