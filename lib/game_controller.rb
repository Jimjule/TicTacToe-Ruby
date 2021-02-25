class Game_controller
  attr_reader :tictactoe_jules, :in_out

  def initialize(tictactoe_jules, in_out)
    @tictactoe_jules = tictactoe_jules
    @in_out = in_out
    welcome
    format_board
  end

  def go
    until @tictactoe_jules.game_is_over
      take_turn
    end
    announce_winner
  end

  def take_turn
    @in_out.print("#{@tictactoe_jules.current_player.id}'s move")
    @tictactoe_jules.submit_move
    @in_out.clear
    format_board
  end

  def welcome
    @in_out.clear
    @in_out.print('Welcome to TicTacToe')
  end

  def announce_winner
    @in_out.print("#{@tictactoe_jules.current_player.id} is the winner!") if @tictactoe_jules.winner
    @in_out.print('Draw!') unless @tictactoe_jules.winner
  end

  def format_board
    board = []
    board_middle = @tictactoe_jules.board.get_board_values
    board << board_top_and_bottom
    assemble_board_middle(board, board_middle)
    board << board[0]
    board
    @in_out.print(board)
  end

  def board_top_and_bottom
    board_top_and_bottom = []
    board_row = '-'
    beginning_and_end_length = 2
    (@tictactoe_jules.board.board_size + beginning_and_end_length).times do
      board_top_and_bottom.push(board_row)
    end
    board_top_and_bottom = [board_top_and_bottom.join]
  end

  def assemble_board_middle(board, board_middle)
    board_column = '|'
    board_middle.each do |section|
      board << board_column + section.join + board_column
    end
  end
end
