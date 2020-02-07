# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

class Game
  attr_reader(:player, :board, :winner)

  def initialize
    @player = Player.new
    @board = Board.new(set_board_size)
    @turn_count = 0
    @winner = false 
    puts 'Welcome to TicTacToe'
  end

  def go
    until game_is_over
      @player.change_player
      @board.player_move(@player.current_player)
      @winner = check_for_winner
      @turn_count += 1
    end
    announce_winner
  end

  private
  def set_board_size
    board_size = -1
    puts 'Please enter the length of a board side'
    until valid_board_size(board_size)
      board_size = gets.chomp.to_i
    end
    return board_size 
  end

  def valid_board_size(board_size)
    board_size.is_a?(Integer) && board_size > 0
  end

  def view_board
    @board.view_board
  end

  def game_is_over
    @turn_count == @board.max_turns || @winner
  end

  def check_for_winner
    @board.check_for_winner(@player.current_player)
  end

  def announce_winner
    puts "#{@player.current_player} is the winner!" if @winner
    puts 'Draw!' unless @winner
  end
end
