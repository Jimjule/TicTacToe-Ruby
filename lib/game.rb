class Game
  attr_reader :player_x, :player_o, :board, :in_out, :winner

  def initialize(in_out, player_x, player_o, board)
    @turn_count = 0
    @in_out = in_out
    welcome
    @player_x = player_x
    @player_o = player_o
    @board = board
    @winner = false
  end

  def go
    @in_out.print(@board.view_board)
    until game_is_over
      turn_loop
    end
    announce_winner
  end

  def current_player
    @turn_count % 2 == 0 ? @player_x : @player_o
  end

  private

  def welcome
    @in_out.print('Welcome to TicTacToe')
  end

  def turn_loop
    @in_out.print("#{current_player.id}'s move")
    submit_move
    @winner = @board.check_for_winner(current_player.mark)
    @turn_count += 1 unless @winner
  end

  def submit_move
    player_move = current_player.make_move(@board)
    @board.make_move(current_player.mark, player_move)
    @in_out.print(@board.view_board)
  end

  def game_is_over
    @turn_count == @board.max_turns || @winner
  end

  def announce_winner
    @in_out.print("#{current_player.id} is the winner!") if @winner
    @in_out.print('Draw!') unless @winner
  end
end
