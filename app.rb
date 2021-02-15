require './lib/player_factory'

player_factory = Player_factory.new(STDIN, STDOUT)
player_factory.start_game
