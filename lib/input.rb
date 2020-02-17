# frozen_string_literal: true

class Input
  def set_board_size
    board_size = -1
    puts 'Please enter the length of a board side'
    until valid_board_size(board_size)
      board_size = gets.chomp.to_i
    end
    board_size
  end

  def valid_board_size(board_size)
    board_size.is_a?(Integer) && board_size.positive?
  end

  def select_move(max_turns)
    player_input = -1
    until valid_player_input(player_input, max_turns)
      puts "Please enter a free number from 1-#{max_turns}"
      player_input = gets.chomp.to_i
    end
    player_input
  end

  def valid_player_input(player_input, max_turns)
    player_input >= 1 && player_input <= max_turns
  end
end
