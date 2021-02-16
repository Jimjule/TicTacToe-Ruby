class Computer_player
  attr_reader :id, :mark
  def initialize(in_out)
    @id = 'Computer'
    @mark = 'O'
  end

  def select_move(board)
    computer_move = select_free_square(board) - 1
  end

  def select_free_square(board)
    get_free_squares(board).sample
  end

  def get_free_squares(board)
    free_squares = []
    for square in board.squares do
      free_squares << square.id if square.is_square_free?
    end
    free_squares
  end
end
