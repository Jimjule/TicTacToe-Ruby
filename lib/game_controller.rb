class Game_controller
  attr_reader :tictactoe_jules

  def initialize(tictactoe_jules)
    @tictactoe_jules = tictactoe_jules
  end

  def go
    @tictactoe_jules.in_out.print(@tictactoe_jules.board.view_board)
    until @tictactoe_jules.tictactoe_jules_is_over
      take_turn
    end
    announce_winner
  end

  def take_turn
    @tictactoe_jules.in_out.print("#{@tictactoe_jules.current_player.id}'s move")
    @tictactoe_jules.submit_move
    @tictactoe_jules.in_out.clear
    @tictactoe_jules.in_out.print(@tictactoe_jules.board.view_board)
  end

  def announce_winner
    @tictactoe_jules.in_out.print("#{@tictactoe_jules.current_player.id} is the winner!") if @tictactoe_jules.winner
    @tictactoe_jules.in_out.print('Draw!') unless @tictactoe_jules.winner
  end
end
