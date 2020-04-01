require './lib/game.rb'

input = Input.new
player_x = Player.new(input.get_player_name('X'), 'X')
player_o = Player.new(input.get_player_name('O'), 'O')

game = Game.new(true, input, player_x, player_o)
game.go
