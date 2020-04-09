require_relative 'square'

class Board
  attr_reader :current_player, :board_middle, :turn_count, :max_turns, :board_size, :squares
  BOARD_ROW = '-'
  BOARD_COLUMM = '|'
  BEGINNING_AND_END_LENGTH = 2
  ITERATE_RISING = -1
  ITERATE_FALLING = 1
  ITERATE_FROM_START = 0

  def initialize(validate, board_size = 3)
    @validate = validate
    @board = []
    @squares = []
    @board_middle = []
    @board_size = board_size
    @max_turns = board_size * board_size
    set_squares
    view_board
  end

  def set_middle_sections
    middle = []
    for square in @squares do
      middle.push(square.value)
    end
    middle = middle.map(&:to_s)
    @board_middle = middle.each_slice(@board_size).to_a
  end

  def view_board
    reset_board
    set_middle_sections
    assemble_board
    @board
  end

  def is_square_free?(square_number)
    @squares[square_number].is_square_free?
  end

  def make_move(current_player, square)
    @squares[square].mark(current_player)
  end

  def check_for_winner(current_player)
    check_row || check_column(current_player) ||
      check_diagonal(current_player, ITERATE_FROM_START, ITERATE_FALLING) ||
      check_diagonal(current_player, @board_size - 1, ITERATE_RISING)
  end

  private

  def set_squares
    i = 1
    until i > @max_turns
      @squares.push(Square.new(i))
      i += 1
    end
  end

  def board_top_and_bottom
    board_top_and_bottom = []
    (@board_size + BEGINNING_AND_END_LENGTH).times do
      board_top_and_bottom.push(BOARD_ROW)
    end
    board_top_and_bottom = [board_top_and_bottom.join]
  end

  def assemble_board
    @board << board_top_and_bottom
    assemble_board_middle
    @board << @board[0]
  end

  def assemble_board_middle
    @board_middle.each do |section|
      @board << BOARD_COLUMM + section.join + BOARD_COLUMM
    end
  end

  def reset_board
    @board = []
  end

  def check_column(current_player)
    @column_iterator = ITERATE_FROM_START
    @line_size = ITERATE_FROM_START
    check_column_loop(current_player) until board_checked(@column_iterator)
    @line_size >= @board_size - 1
  end

  def check_column_loop(current_player)
    for row in @board_middle do
      next_column(row, current_player)
    end
  end

  def next_column(row, current_player)
    row[@column_iterator] == current_player ? line_is_unbroken : new_line
  end

  def line_is_unbroken
    @line_size += 1
  end

  def new_line
    @line_size = ITERATE_FROM_START
    @column_iterator += 1
  end

  def board_checked(iterator)
    iterator >= @board_size || @line_size >= @board_size - 1
  end

  def check_row
    for row in @board_middle do
      row_win = true if row.uniq.length == 1
    end
    row_win
  end

  def check_diagonal(current_player, diagonal_iterator, iterate_step)
    @line_size = ITERATE_FROM_START
    @diagonal_iterator = diagonal_iterator
    diagonal_check_loop(current_player, iterate_step)
    @line_size >= @board_size
  end

  def diagonal_check_loop(current_player, iterate_step)
    for row in @board_middle do
      next_diagonal(iterate_step) if row[@diagonal_iterator] == current_player
    end
  end

  def next_diagonal(iterate_step)
    @diagonal_iterator += iterate_step
    line_is_unbroken
  end
end
