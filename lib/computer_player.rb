class Computer_player
  attr_reader :id, :mark
  def initialize(id = 'Computer', mark = 'O')
    @id = id
    @mark = mark
  end

  def select_move(board, move = nil)
    if move == nil
      select_free_square(board) - 1
    else
      move
    end
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
