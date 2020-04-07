require 'game'
require 'human_player'
require 'board'
require 'validate'

describe Game do
  it 'Ends with player X' do
    @in_out = Console_in_out.new('', '')
    validate = Validate.new
    @player_x = Human_player.new('Player 1', 'X', @in_out)
    @player_o = Human_player.new('Player 2', 'O', @in_out)
    @board = Board.new(@in_out, validate)
    game = Game.new(@in_out, @player_x, @player_o, @board)
    allow(game.in_out).to receive(:gets).and_return('1', '2', '3', '4', '6', '5', '7', '9', '8')
    game.go
    expect(game.winner).to eq false
    expect(game.current_player.mark).to eq 'O'
  end
end
