class Game_controller
  attr_reader :game

  def initialize(game)
    @game = game
  end

  def go
    @game.in_out.print(@game.board.view_board)
    until @game.game_is_over
      @game.turn_loop
    end
    @game.announce_winner
  end
end
