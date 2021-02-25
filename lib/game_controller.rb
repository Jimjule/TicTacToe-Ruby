class Game_controller
  attr_reader :tictactoe_jules, :in_out

  def initialize(tictactoe_jules, in_out)
    @tictactoe_jules = tictactoe_jules
    @in_out = in_out
    welcome
  end

  def go
    @in_out.print(@tictactoe_jules.board.view_board)
    until @tictactoe_jules.tictactoe_jules_is_over
      take_turn
    end
    announce_winner
  end

  def take_turn
    @in_out.print("#{@tictactoe_jules.current_player.id}'s move")
    @tictactoe_jules.submit_move
    @in_out.clear
    @in_out.print(@tictactoe_jules.board.view_board)
  end

  def welcome
    @in_out.clear
    @in_out.print('Welcome to TicTacToe')
  end
  
  def announce_winner
    @in_out.print("#{@tictactoe_jules.current_player.id} is the winner!") if @tictactoe_jules.winner
    @in_out.print('Draw!') unless @tictactoe_jules.winner
  end
end
