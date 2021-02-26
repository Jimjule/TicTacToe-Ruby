class Tictactoe_jules
  attr_reader :player_x, :player_o, :board, :winner, :turn_count

  def initialize(player_x, player_o, board)
    @turn_count = 1
    @player_x = player_x
    @player_o = player_o
    @board = board
    @winner = false
  end

  def current_player
    @turn_count % 2 == 0 ? @player_o : @player_x
  end

  def submit_move(move = '')
    puts move
    if move == ''
      player_move = current_player.select_move(@board, move)
      @board.make_move(current_player.mark, player_move)
      @winner = @board.check_for_winner(current_player.mark)
      @turn_count += 1 unless @winner
    else
      player_move = current_player.select_move(@board, move)
      @board.make_move(current_player.mark, player_move)
      @winner = @board.check_for_winner(current_player.mark)
      @turn_count += 1 unless @winner
    end
  end

  def game_is_over
    @turn_count > @board.max_turns || @winner
  end
end
