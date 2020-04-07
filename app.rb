require './lib/game.rb'
require './lib/validate.rb'
require './lib/computer_player.rb'

@inOut = ConsoleInOut.new(STDIN, STDOUT)
@validate = Validate.new

def get_player_name(mark)
  player = ''
  until @validate.is_valid_player_name?(player)
    @inOut.print("Please enter a name for #{mark}\n")
    player = @inOut.get_string
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

def select_opponent
  @inOut.print("Would you like to play against the computer? (y/N)\n")
  player_2 = @inOut.play_against_computer?(@inOut.get_string)
  player_2 == true ? ComputerPlayer.new(@inOut) : HumanPlayer.new(get_player_name('Player O'), 'O', @inOut)
end

player_1 = get_player_name('Player X')
player_x = HumanPlayer.new(player_1, 'X', @inOut)
player_o = select_opponent

board_size = get_board_size

board = Board.new(@inOut, @validate, board_size)

game = Game.new(@inOut, player_x, player_o, board)
game.go
