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
