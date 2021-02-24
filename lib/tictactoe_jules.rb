require_relative 'game_controller'
require_relative 'game'
require_relative 'player_factory'
require_relative 'validate'
require_relative 'board'

class Tictactoe_jules
  attr_reader :game_controller
  def initialize(in_out = Console_in_out.new(STDIN, STDOUT))
    @in_out = in_out

    validate = Validate.new
    player_x_name = assign_player_name('Player X')

    player_x = Player_factory.generate('X', false, in_out, player_x_name)

    computer_player = in_out.get_play_against_computer

    player_o_name = assign_player_name('Player O') if !computer_player
    player_o = Player_factory.generate('O', computer_player, in_out, player_o_name)

    board_size = assign_board_size
    @board = Board.new(board_size)

    game = Game.new(in_out, player_x, player_o, @board)

    welcome
    
    @game_controller = Game_controller.new(game)
  end

  private
  def assign_player_name(which_player)
    player_name = ''
    until Validate.is_valid_player_name?(player_name)
      player_name = @in_out.get_player_name(which_player)
    end
    player_name
  end

  def assign_board_size
    board_size = ''
    until Validate.is_valid_board_size?(board_size)
      board_size = @in_out.set_board_size
    end
    board_size
  end

  def welcome
    @in_out.clear
    @in_out.print('Welcome to TicTacToe')
  end
end