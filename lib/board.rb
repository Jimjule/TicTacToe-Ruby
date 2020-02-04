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
    @board_top_and_bottom = []
    @board_middle = []
    @board_middle_section = []
    @board_size = board_size
    @turn_count = 0
    @max_turns = board_size * board_size
    @winner = false
    set_board
  end

  def set_board
    set_board_top_and_bottom
    set_board_middle
    view_board
  end

  def set_board_top_and_bottom
    (@board_size + BEGINNING_AND_END_LENGTH).times do
      @board_top_and_bottom.push(BOARD_ROW)
    end
    @board_top_and_bottom = [@board_top_and_bottom.join]
  end

  def set_board_middle
    add_board_spaces
    @board_size.times do
      @board_middle << @board_middle_section.join
    end
  end

  def add_board_spaces
    @board_size.times do
      @board_middle_section.push('.')
    end
  end

  def assemble_board
    @board << @board_top_and_bottom
    @board_middle.each do |section|
      @board << BOARD_COLUMM + section + BOARD_COLUMM
    end
    @board << @board_top_and_bottom
  end

  def view_board
    system('clear')
    reset_board
    assemble_board
    puts @board
  end

  def reset_board
    @board = []
  end

  def player_move(current_player)
    player_input = -1
    while player_input < 1 || player_input > @max_turns
      puts "Please enter a free number from 1-#{@max_turns}"
      player_input = gets.chomp.to_i
      @row = (player_input - 1) / @board_size
      @column = (player_input - 1) % @board_size
      check_square_is_free(current_player, player_input)
    end
    make_move(player_input, current_player)
    view_board
  end

  def check_square_is_free(current_player, square)
    puts current_player
    player_move(current_player) if square > @max_turns
    player_move(current_player) if @board_middle[@row][@column] != '.'
  end

  def make_move(square, current_player)
    @board_middle[@row] = @board_middle[@row].split('')
    @board_middle[@row][@column] = current_player
    @board_middle[@row] = @board_middle[@row].join
    store_player_move(square, current_player)
  end

  def store_player_move(square, current_player)
    current_player == 'X' ? @x_moves.push(square) : @o_moves.push(square)
  end

  def check_for_winner(current_player)
    current_player == 'X' ? current_player_moves = @x_moves : current_player_moves = @o_moves
    return check_column(current_player_moves) || check_row(current_player_moves) || check_diagonal(current_player_moves)
  end

  def check_column(moves_to_check)
    for square in moves_to_check do
      return moves_to_check.include?(square + @board_size) && moves_to_check.include?(square + @board_size * 2)
    end
  end

  def check_row(moves_to_check)
    return moves_to_check.include?(1) && moves_to_check.include?(2) && moves_to_check.include?(3) ||
           moves_to_check.include?(4) && moves_to_check.include?(5) && moves_to_check.include?(6) ||
           moves_to_check.include?(7) && moves_to_check.include?(8) && moves_to_check.include?(9)
  end

  def check_diagonal(moves_to_check)
    return moves_to_check.include?(1) && moves_to_check.include?(9) && moves_to_check.include?(5) ||
           moves_to_check.include?(3) && moves_to_check.include?(7) && moves_to_check.include?(5)
  end

  def increment_turn_count
    @turn_count += 1
  end
end
