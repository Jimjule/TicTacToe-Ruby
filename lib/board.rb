require_relative 'square'

class Board
  attr_reader :current_player, :turn_count, :max_turns, :board_size, :squares

  def initialize(board_size = 3)
    @squares = []
    @board_size = board_size
    @max_turns = board_size * board_size
    @last_move = 0
    set_squares
  end

  def get_board_values
    middle = []
    for square in @squares do
      middle.push(square.value)
    end
    middle = middle.map(&:to_s)
    board_middle = middle.each_slice(@board_size).to_a
  end

  def is_square_free?(square_number)
    @squares[square_number - 1].is_square_free?
  end

  def make_move(current_player, square)
    @squares[square.to_i - 1].mark(current_player)
    @last_move = square.to_i - 1
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

  def check_column(current_player)
    @column_iterator = @iterate_from_start
    @line_size = @iterate_from_start
    check_column_loop(current_player)
  end

  def check_column_loop(current_player)
    for row in get_board_values do
      return false if row[@last_move % @board_size] != current_player
    end
    true
  end

  def new_line
    @line_size = @iterate_from_start
    @column_iterator += 1
  end

  def board_checked(iterator)
    iterator >= @board_size || @line_size >= @board_size - 1
  end

  def check_row
    for row in get_board_values do
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
    for row in get_board_values do
      next_diagonal(iterate_step) if row[@diagonal_iterator] == current_player
    end
  end

  def next_diagonal(iterate_step)
    @diagonal_iterator += iterate_step
    @line_size += 1
  end
end
