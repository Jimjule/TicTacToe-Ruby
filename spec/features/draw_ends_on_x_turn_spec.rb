require 'game_controller'
require 'game'
require 'human_player'
require 'board'

describe Game do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }

  it 'Ends with player X' do
    @in_out = Console_in_out.new(input, output)
    @player_x = Human_player.new('Player 1', 'X', @in_out)
    @player_o = Human_player.new('Player 2', 'O', @in_out)
    @board = Board.new
    game = Game.new(@in_out, @player_x, @player_o, @board)
    game_controller = Game_controller.new(game)
    allow(game_controller.game.in_out.input).to receive(:gets).and_return('1', '2', '3', '4', '6', '5', '7', '9', '8')
    game_controller.go
    expect(game_controller.game.winner).to eq false
    expect(game_controller.game.current_player.mark).to eq 'O'
  end
end
