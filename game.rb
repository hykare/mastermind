require 'board'
class Game
  def initialize
    @board = Board.new
    @rounds_left = 12
    puts 'initialized game'
  end

  def play
    puts 'playing game'
  end


end
