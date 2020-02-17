# frozen_string_literal: true

require_relative 'board'
require_relative 'input'

class Game
  attr_reader(:board, :input, :winner)

  def initialize
    @input = Input.new
    @board = Board.new(@input.set_board_size)
    @turn_count = 0
    @winner = false
    puts 'Welcome to TicTacToe'
  end

  def go
    until game_is_over
      turn_loop
    end
    announce_winner
  end

  def current_player
    @turn_count % 2 == 0 ? 'X' : 'O'
  end

  private

  def turn_loop
    puts "#{current_player}'s move"
    submit_move
    @winner = @board.check_for_winner(current_player)
    @turn_count += 1 unless @winner
  end

  def submit_move
    player_input = @input.select_move(@board.max_turns)
    row = (player_input - 1) / @board.board_size
    column = (player_input - 1) % @board.board_size
    @board.make_move(current_player, row, column)
    @board.view_board
  end

  def game_is_over
    @turn_count == @board.max_turns || @winner
  end

  def announce_winner
    puts "#{current_player} is the winner!" if @winner
    puts 'Draw!' unless @winner
  end
end
