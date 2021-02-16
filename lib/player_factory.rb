require_relative 'console_in_out'
require_relative 'human_player'
require_relative 'computer_player'

class Player_factory
  def self.generate(player, is_a_computer, in_out, name)
    is_a_computer == true ? Computer_player.new(in_out) : Human_player.new(name, player, in_out)
  end
end
