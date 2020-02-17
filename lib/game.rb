# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'input'

class Game
  attr_reader(:player, :board, :input, :winner)

  def initialize
    @player = Player.new
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

  private

  def turn_loop
    @player.change_player
    submit_move
    @winner = @board.check_for_winner(@player.current_player)
    @turn_count += 1
  end

  def submit_move
    player_input = @input.select_move(@board.max_turns)
    row = (player_input - 1) / @board.board_size
    column = (player_input - 1) % @board.board_size
    @board.make_move(@player.current_player, row, column)
    @board.view_board
  end

  def game_is_over
    @turn_count == @board.max_turns || @winner
  end

  def announce_winner
    puts "#{@player.current_player} is the winner!" if @winner
    puts 'Draw!' unless @winner
  end
end
