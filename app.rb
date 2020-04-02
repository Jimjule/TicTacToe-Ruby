require './lib/game.rb'

command_line_application = true

inOut = ConsoleInOut.new
player_x = Player.new(input.get_player_name('X'), 'X')
player_o = Player.new(input.get_player_name('O'), 'O')
board = Board.new(input.set_board_size, command_line_application)

game = Game.new(command_line_application, inOut, player_x, player_o, board)
game.go
