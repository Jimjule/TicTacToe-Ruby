require_relative 'human_player'
require_relative 'computer_player'

class Player_factory
  def self.generate(player, is_a_computer, name)
    is_a_computer == true ? Computer_player.new(name, player) : Human_player.new(name, player)
  end
end
