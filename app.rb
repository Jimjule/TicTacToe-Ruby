require './lib/game'
require './lib/validate'
require './lib/console_in_out'
require './lib/human_player'
require './lib/computer_player'
require './lib/board'

@in_out = Console_in_out.new(STDIN, STDOUT)
@validate = Validate.new

def get_player_name(which_player)
  player_name = ''
  until @validate.is_valid_player_name?(player_name)
    @in_out.print("Please enter a name for #{which_player}\n")
    player_name = @in_out.get_string
  end
  player_name
end

def get_board_size
  board_size = ''
  until @validate.is_valid_board_size?(board_size)
    board_size = @in_out.set_board_size
  end
  board_size
end

def select_opponent
  @in_out.print("Would you like to play against the computer? (y/N)\n")
  player_2 = @in_out.play_against_computer?(@in_out.get_string)
  player_2 == true ? Computer_player.new(@in_out) : Human_player.new(get_player_name('Player O'), 'O', @in_out)
end

player_1_name = get_player_name('Player X')
player_x = Human_player.new(player_1_name, 'X', @in_out)
player_o = select_opponent

board_size = get_board_size

board = Board.new(@validate, board_size)

game = Game.new(@in_out, player_x, player_o, board)
game.go
