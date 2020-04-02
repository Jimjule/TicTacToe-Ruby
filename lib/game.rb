require_relative 'player'
require_relative 'board'
require_relative 'consoleInOut'

class Game
  attr_reader :player_x, :player_o, :board, :inOut, :winner

  def initialize(inOut, player_x, player_o, board)
    @turn_count = 0
    @inOut = inOut
    welcome
    @player_x = player_x
    @player_o = player_o
    @board = board
    @winner = false
  end

  def go
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
    @inOut.write('Welcome to TicTacToe')
  end

  def turn_loop
    @inOut.write("#{current_player.id}'s move")
    submit_move
    @winner = @board.check_for_winner(current_player.mark)
    @turn_count += 1 unless @winner
  end

  def submit_move
    player_input = @inOut.select_move(@board.max_turns)
    @board.make_move(current_player.mark, row = (player_input - 1) / @board.board_size, column = (player_input - 1) % @board.board_size)
    @board.view_board
  end

  def game_is_over
    @turn_count == @board.max_turns || @winner
  end

  def announce_winner
    @inOut.write("#{current_player.id} is the winner!") if @winner
    @inOut.write('Draw!') unless @winner
  end
end
