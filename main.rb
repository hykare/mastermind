$LOAD_PATH << '.'
require 'game'

def choose_game_mode
  puts 'Play as:'
  puts '1 codebreaker'
  puts '2 codemaker'
  game_mode = gets.chomp.to_i
  case game_mode
  when 1
    Game.new
  when 2
    GameAsCodeMaker.new
  else
    Game.new
  end
end

game_on = true
while game_on
  game = choose_game_mode
  game.play
  game.final_screen
  puts 'Would you like to play again? y/n'
  game_on = gets.chomp == 'y'
end
