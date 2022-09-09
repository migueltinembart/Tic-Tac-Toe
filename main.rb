require_relative 'lib/board'
require_relative 'lib/display'
require_relative 'lib/game'
require_relative 'lib/player'

def play_game
    game = Game.new
    puts game.play
end

play_game
