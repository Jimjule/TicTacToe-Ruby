class Human_player
  attr_reader :id, :mark
  def initialize(id, mark, in_out)
    @in_out = in_out
    @id = id
    @mark = mark
  end

  def make_move(board)
    valid_move = false
    until (valid_move)
      print("Please enter a free number from 1-#{board.max_turns}\n")
      player_input = @in_out.select_move - 1
      valid_move = player_input <= board.max_turns && player_input >= -board.max_turns && board.is_square_free?(player_input)
    end
    player_input
  end
end
