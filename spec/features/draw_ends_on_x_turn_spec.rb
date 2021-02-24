require 'game_controller'
require 'tictactoe_jules'
require 'human_player'
require 'board'

describe Tictactoe_jules do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }

  it 'Ends with player X' do
    in_out = Console_in_out.new(input, output)
    player_x = Human_player.new('Player 1', 'X', in_out)
    player_o = Human_player.new('Player 2', 'O', in_out)
    board = Board.new
    tictactoe_jules = Tictactoe_jules.new(in_out, player_x, player_o, board)
    game_controller = Game_controller.new(tictactoe_jules)
    allow(game_controller.tictactoe_jules.in_out.input).to receive(:gets).and_return('1', '2', '3', '4', '6', '5', '7', '9', '8')
    game_controller.go
    expect(game_controller.tictactoe_jules.winner).to eq false
    expect(game_controller.tictactoe_jules.current_player.mark).to eq 'O'
  end
end
