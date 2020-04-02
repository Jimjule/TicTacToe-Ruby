require './lib/game.rb'

inOut = ConsoleInOut.new(STDIN, STDOUT)
player_x = Player.new(inOut.get_player_name('X'), 'X')
player_o = Player.new(inOut.get_player_name('O'), 'O')
board = Board.new(inOut, inOut.set_board_size)

game = Game.new(inOut, player_x, player_o, board)
game.go
