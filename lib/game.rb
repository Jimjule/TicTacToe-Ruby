require_relative 'human_player'
require_relative 'board'
require_relative 'console_in_out'

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
    @inOut.print('Welcome to TicTacToe')
  end

  def turn_loop
    @inOut.print("#{current_player.id}'s move")
    submit_move
    @winner = @board.check_for_winner(current_player.mark)
    @turn_count += 1 unless @winner
  end

  def submit_move
    valid_move = false
    until(valid_move)
      print("Please enter a free number from 1-#{@board.max_turns}\n")
      player_input = current_player.make_move(@board.max_turns)
      valid_move = @board.is_square_free?(player_input - 1)
    end
    @board.make_move(current_player.mark, player_input - 1)
    @board.view_board
  end

  def game_is_over
    @turn_count == @board.max_turns || @winner
  end

  def announce_winner
    @inOut.print("#{current_player.id} is the winner!") if @winner
    @inOut.print('Draw!') unless @winner
  end
end
