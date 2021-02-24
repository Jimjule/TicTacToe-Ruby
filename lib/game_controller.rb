class Game_controller
  attr_reader :game

  def initialize(game)
    @game = game
  end

  def go
    @game.in_out.print(@game.board.view_board)
    until @game.game_is_over
      take_turn
    end
    announce_winner
  end

  def take_turn
    @game.in_out.print("#{@game.current_player.id}'s move")
    @game.submit_move
    @game.in_out.clear
    @game.in_out.print(@game.board.view_board)
  end

  def announce_winner
    @game.in_out.print("#{@game.current_player.id} is the winner!") if @game.winner
    @game.in_out.print('Draw!') unless @game.winner
  end
end
