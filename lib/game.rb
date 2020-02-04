# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

class Game
  attr_reader(:player, :board, :winner)

  def initialize(board_size = 3, player = Player.new, board = Board.new(board_size))
    @player = player
    @board = board
    @turn_count = 0
    @winner = false
    welcome
  end

  def welcome
    puts 'Welcome to TicTacToe'
  end

  def go
      until @turn_count == @board.max_turns || @winner
        @player.change_player
        @board.player_move(@player.current_player)
        @winner = check_for_winner
        increment_turn_count
      end
      announce_winner
  end

  private
  def view_board
    @board.view_board
  end

  def check_for_winner
    @board.check_for_winner(@player.current_player)
  end

  def announce_winner
    puts "#{@player.current_player} is the winner!" if @winner
    puts 'Draw!' if !@winner
  end

  def increment_turn_count
    @turn_count += 1
  end
end
