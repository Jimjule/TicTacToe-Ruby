require_relative 'square'

class Board
  attr_reader :current_player, :board_middle, :turn_count, :max_turns, :board_size, :squares

  def initialize(validate, board_size = 3)
    @validate = validate
    @squares = []
    @board_size = board_size
    @max_turns = board_size * board_size
    set_squares
    view_board
  end

  def view_board
    board = []
    board << board_top_and_bottom
    board_middle = get_middle_sections
    assemble_board_middle(board, board_middle)
    board << board[0]
    board
  end

  def get_middle_sections
    middle = []
    for square in @squares do
      middle.push(square.value)
    end
    middle = middle.map(&:to_s)
    board_middle = middle.each_slice(@board_size).to_a
  end

  def is_square_free?(square_number)
    @squares[square_number].is_square_free?
  end

  def make_move(current_player, square)
    @squares[square].mark(current_player)
  end

  def check_for_winner(current_player)
    @iterate_rising = -1
    @iterate_falling = 1
    @iterate_from_start = 0
    check_row || check_column(current_player) ||
      check_diagonal(current_player, @iterate_from_start, @iterate_falling) ||
      check_diagonal(current_player, @board_size - 1, @iterate_rising)
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
    board_row = '-'
    beginning_and_end_length = 2
    (@board_size + beginning_and_end_length).times do
      board_top_and_bottom.push(board_row)
    end
    board_top_and_bottom = [board_top_and_bottom.join]
  end

  def assemble_board_middle(board, board_middle)
    board_column = '|'
    board_middle.each do |section|
      board << board_column + section.join + board_column
    end
  end

  def check_column(current_player)
    @column_iterator = @iterate_from_start
    @line_size = @iterate_from_start
    check_column_loop(current_player) until board_checked(@column_iterator)
    @line_size >= @board_size - 1
  end

  def check_column_loop(current_player)
    for row in get_middle_sections do
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
    @line_size = @iterate_from_start
    @column_iterator += 1
  end

  def board_checked(iterator)
    iterator >= @board_size || @line_size >= @board_size - 1
  end

  def check_row
    for row in get_middle_sections do
      row_win = true if row.uniq.length == 1
    end
    row_win
  end

  def check_diagonal(current_player, diagonal_iterator, iterate_step)
    @line_size = @iterate_from_start
    @diagonal_iterator = diagonal_iterator
    diagonal_check_loop(current_player, iterate_step)
    @line_size >= @board_size
  end

  def diagonal_check_loop(current_player, iterate_step)
    for row in get_middle_sections do
      next_diagonal(iterate_step) if row[@diagonal_iterator] == current_player
    end
  end

  def next_diagonal(iterate_step)
    @diagonal_iterator += iterate_step
    line_is_unbroken
  end
end
