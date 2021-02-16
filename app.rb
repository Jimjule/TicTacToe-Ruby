require './lib/player_factory'
require './lib/board_factory'
require './lib/game'

in_out = Console_in_out.new(STDIN, STDOUT)
validate = Validate.new

player_factory = Player_factory.new(in_out, validate)
player_x = player_factory.player_x
player_o = player_factory.player_o

board_factory = Board_factory.new(in_out, validate)
board = board_factory.board

game = Game.new(in_out, player_x, player_o, board)
game.go
