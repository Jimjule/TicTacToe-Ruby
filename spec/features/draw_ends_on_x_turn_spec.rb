require 'game'
require 'player'
require 'board'

describe Game do

  before(:each) do
    @input = ConsoleInOut.new
    @player_x = Player.new('Player 1', 'X')
    @player_o = Player.new('Player 2', 'O')
    @board = Board.new(3, true)
  end

  it 'Ends with player X' do
    game = Game.new(true, @input, @player_x, @player_o, @board)
    allow(game.input).to receive(:gets).and_return('1', '2', '3', '4', '6', '5', '7', '9', '8')
    game.go
    expect(game.winner).to eq false
    expect(game.current_player.mark).to eq 'O'
  end
end
