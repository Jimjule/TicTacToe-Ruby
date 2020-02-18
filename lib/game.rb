# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'input'

class Game
  attr_reader :player_x, :player_o, :board, :input, :winner

  X_MARK = 'X'
  O_MARK = 'O'

  def initialize
    puts 'Welcome to TicTacToe'
    @turn_count = 0
    @input = Input.new
    @player_x = Player.new(@input.set_player_name('X'), X_MARK)
    @player_o = Player.new(@input.set_player_name('O'), O_MARK)
    @board = Board.new(@input.set_board_size)
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

  def turn_loop
    puts "#{current_player.id}'s move"
    submit_move
    @winner = @board.check_for_winner(current_player.mark)
    @turn_count += 1 unless @winner
  end

  def submit_move
    player_input = @input.select_move(@board.max_turns)
    row = (player_input - 1) / @board.board_size
    column = (player_input - 1) % @board.board_size
    @board.make_move(current_player.mark, row, column)
    @board.view_board
  end

  def game_is_over
    @turn_count == @board.max_turns || @winner
  end

  def announce_winner
    puts "#{current_player.id} is the winner!" if @winner
    puts 'Draw!' unless @winner
  end
end
