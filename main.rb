$LOAD_PATH << '.'
require 'game'

game_on = true
while game_on
  game = Game.new
  game.play
  puts 'Would you like to play again?'
  game_on = gets.chomp == 'y'
end
