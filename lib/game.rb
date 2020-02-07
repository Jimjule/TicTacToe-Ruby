# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

class Game
  attr_reader(:player, :board, :winner)

  def initialize
    @player = Player.new
    @board = Board.new(@player.set_board_size)
    @turn_count = 0
    @winner = false
    puts 'Welcome to TicTacToe'
  end

  def go
    until game_is_over
      @player.change_player
      submit_move
      @winner = @board.check_for_winner(@player.current_player)
      @turn_count += 1
    end
    announce_winner
  end

  private

  def submit_move
    player_move = @player.select_move(@board.max_turns)
    @board.make_move(@player.current_player, calculate_row(player_move), calculate_column(player_move))
    @board.view_board
  end

  def calculate_row(player_input)
    (player_input - 1) / @board.board_size
  end

  def calculate_column(player_input)
    (player_input - 1) % @board.board_size
  end

  def game_is_over
    @turn_count == @board.max_turns || @winner
  end

  def announce_winner
    puts "#{@player.current_player} is the winner!" if @winner
    puts 'Draw!' unless @winner
  end
end
