require 'board'
class Game
  def initialize
    @board = Board.new
    @rounds_left = 12
    @code = Array.new(4).map { rand(1..6) }
  end

  def play
    puts 'playing game'
  end


end
