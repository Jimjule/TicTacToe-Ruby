# frozen_string_literal: true

class Board
  attr_reader(:current_player, :winner, :board_middle, :turn_count, :max_turns, :board_size)
  BOARD_ROW = '-'
  BOARD_COLUMM = '|'
  BEGINNING_AND_END_LENGTH = 2

  def initialize(board_size = 3)
    @board = []
    @x_moves = []
    @o_moves = []
    @board_middle = []
    @board_middle_section = []
    @board_size = board_size
    @max_turns = board_size * board_size
    set_board
  end

  def set_board
    set_middle_sections
    view_board
  end

  def set_middle_sections
    middle =* (1..@max_turns)
    middle = middle.map(&:to_s)
    @board_middle = middle.each_slice(@board_size).to_a
  end

  def view_board
    system('clear')
    reset_board
    assemble_board
    puts @board
  end

  def player_move(current_player)
    player_input = -1
    until player_input >= 1 && player_input <= @max_turns
      puts "Please enter a free number from 1-#{@max_turns}"
      player_input = gets.chomp.to_i
      @row = (player_input - 1) / @board_size
      @column = (player_input - 1) % @board_size
      check_square_is_free(current_player, player_input)
    end
    make_move(player_input, current_player)
    view_board
  end

  def check_for_winner(current_player)
    current_player == 'X' ? current_player_moves = @x_moves : current_player_moves = @o_moves
    return check_row || check_column(current_player) || check_diagonal_falling(current_player) || check_diagonal_rising(current_player)
  end

  private
  def board_top_and_bottom
    board_top_and_bottom = []
    (@board_size + BEGINNING_AND_END_LENGTH).times do
      board_top_and_bottom.push(BOARD_ROW)
    end
    return board_top_and_bottom = [board_top_and_bottom.join]
  end

  def assemble_board
    @board << board_top_and_bottom
    @board_middle.each do |section|
      @board << BOARD_COLUMM + section.join + BOARD_COLUMM
    end
    @board << @board[0]
  end

  def reset_board
    @board = []
  end

  def make_move(square, current_player)
    @board_middle[@row] = @board_middle[@row]
    @board_middle[@row][@column] = current_player
    @board_middle[@row] = @board_middle[@row]
  end

  def check_square_is_free(current_player, square)
    player_move(current_player) if square > @max_turns
    player_move(current_player) if @board_middle[@row][@column] == 'X' || @board_middle[@row][@column] == 'O'
  end

  def store_player_move(square, current_player)
    current_player == 'X' ? @x_moves.push(square) : @o_moves.push(square)
  end

  def check_column(current_player)
    column_win = false
    column_iterator = 0
    line_size = 1
    until column_iterator >= @board_size || line_size >= @board_size do
      for row in @board_middle do
	if row[column_iterator] == current_player
	  line_size += 1
	else
	  line_size = 1 
	  column_iterator += 1
	end
      end
    end
    column_win = true if line_size >= @board_size
    return column_win
  end

  def check_row
    row_win = false
    for row in @board_middle do
     row_win = true if row.uniq.length == 1
    end 
    return row_win
  end

  def check_diagonal_falling(current_player)
    diagonal_falling_win = false
    diagonal_iterator = 0 
    line_size = 0 
    for row in @board_middle do
	if row[diagonal_iterator] == current_player
	diagonal_iterator += 1
	line_size += 1
      end
    end
    diagonal_falling_win = true if line_size >= @board_size 
    return diagonal_falling_win  
  end

  def check_diagonal_rising(current_player)
    diagonal_rising_win = false
    diagonal_iterator = @board_size - 1
    line_size = 0 
    for row in @board_middle do
	if row[diagonal_iterator] == current_player
	diagonal_iterator -= 1
	line_size += 1
      end
    end
    diagonal_rising_win = true if line_size >= @board_size 
    return diagonal_rising_win  
  end
end
