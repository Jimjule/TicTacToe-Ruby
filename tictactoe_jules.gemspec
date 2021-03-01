Gem::Specification.new do |spec|
  spec.name = 'tictactoe_jules'
  spec.version = '0.0.9'
  spec.summary = 'The logic for a TicTacToe game with extra features.'
  spec.description = 'The logic for a TicTacToe game that should work in the console or in erb. Board size can be changed. Can be human-human or human-computer, and human players are named.'
  spec.authors = ['Jules Roadknight']
  spec.email = 'roadknightj@gmail.com'
  spec.files = ['./lib/tictactoe_jules.rb', './spec/tictactoe_jules_spec.rb',
    './lib/board.rb', './spec/board_spec.rb', 
    './lib/computer_player.rb', './spec/computer_player_spec.rb', 
    './lib/human_player.rb', './spec/human_player_spec.rb', 
    './lib/player_factory.rb', './spec/player_factory_spec.rb', 
    './lib/square.rb', './spec/square_spec.rb', 
    './lib/validate.rb', './spec/validate_spec.rb',
    './spec/features/can_win_and_declare_winner_spec.rb',
    './spec/features/can_win_on_other_board_sizes_spec.rb',
    './spec/features/draw_ends_on_x_turn_spec.rb'
  ]
  spec.homepage = 'https://rubygems.org/gems/tictactoe_jules'
  spec.license = 'MIT'
  spec.add_development_dependency 'rspec', '~>3.9.0'
  spec.add_development_dependency 'rake', '~>13.0.1'
end
