require './lib/game.rb'
require './lib/validate.rb'

@inOut = ConsoleInOut.new(STDIN, STDOUT)
@validate = Validate.new

def get_player_name(mark)
  player = ''
  until @validate.is_valid_player_name?(player)
    player = @inOut.get_player_name(mark)
  end
  player
end

def get_board_size
  board_size = ''
  until @validate.is_valid_board_size?(board_size)
    board_size = @inOut.set_board_size
  end
  board_size
end

player_1 = get_player_name('Player X')
player_2 = get_player_name('Player O')
board_size = get_board_size

player_x = Player.new(player_1, 'X', @inOut)
player_o = Player.new(player_2, 'O', @inOut)
board = Board.new(@inOut, @validate, board_size)

game = Game.new(@inOut, player_x, player_o, board)
game.go
