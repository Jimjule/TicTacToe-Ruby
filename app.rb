require './lib/player_factory'
require './lib/tictactoe_jules'
require './lib/validate'
require './lib/board'

validate = Validate.new
in_out = Console_in_out.new(STDIN, STDOUT, validate)

player_x_name = in_out.get_player_name('Player X')
player_x = Player_factory.generate('X', false, in_out, player_x_name)

computer_player = in_out.get_play_against_computer
player_o_name = in_out.get_player_name('Player O') if !computer_player
player_o = Player_factory.generate('O', computer_player, in_out, player_o_name)

board_size = in_out.get_board_size
board = Board.new(board_size)

game = Tictactoe_jules.new(in_out, player_x, player_o, board)
game.go
