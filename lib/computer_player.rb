class Computer_player
  attr_reader :id, :mark
  def initialize(in_out)
    @id = 'Computer'
    @mark = 'O'
  end

  def make_move(board)
    valid_move = false
    until (valid_move)
      computer_move = rand(board.max_turns) - 1
      valid_move = board.is_square_free?(computer_move)
    end
    computer_move
  end
end
