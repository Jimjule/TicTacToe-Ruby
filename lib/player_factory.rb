require_relative 'validate'
require_relative 'console_in_out'
require_relative 'human_player'
require_relative 'computer_player'

class Player_factory
  attr_reader :player_x, :player_o
  def initialize(in_out, validate)
    @in_out = in_out
    @validate = validate

    player_1_name = get_player_name('Player X')
    @player_x = Human_player.new(player_1_name, 'X', @in_out)
    @player_o = select_opponent
  end

  def get_player_name(which_player)
    player_name = ''
    until @validate.is_valid_player_name?(player_name)
      @in_out.print("Please enter a name for #{which_player}\n")
      player_name = @in_out.get_input
    end
    player_name
  end

  def select_opponent
    @in_out.print("Would you like to play against the computer? (y/N)\n")
    player_2 = @in_out.play_against_computer?(@in_out.get_input)
    player_2 == true ? Computer_player.new(@in_out) : Human_player.new(get_player_name('Player O'), 'O', @in_out)
  end
end
