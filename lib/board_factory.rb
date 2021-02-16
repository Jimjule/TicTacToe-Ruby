require_relative 'validate'
require_relative 'console_in_out'
require_relative 'board'

class Board_factory
  attr_reader :board
  def initialize(in_out, validate)
    in_out = in_out
    validate = validate

    board_size = get_board_size(in_out, validate)
    @board = Board.new(validate, board_size)
  end

  def get_board_size(in_out, validate)
    board_size = ''
    until validate.is_valid_board_size?(board_size)
      board_size = in_out.set_board_size
    end
    board_size
  end
end
