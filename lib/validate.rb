class Validate
  def self.is_valid_player_name?(player_name)
    player_name.length > 0 && player_name.length <= 50
  end

  def self.is_valid_board_size?(board_size)
    board_size.is_a?(Integer) && board_size.positive?
  end

  def self.is_valid_player_input?(player_input, max_turns)
    player_input <= max_turns
  end
end
