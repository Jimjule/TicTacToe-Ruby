require 'game'
require 'human_player'
require 'board'
require 'validate'

describe Game do

  it 'Ends with player X' do
    @inOut = ConsoleInOut.new('', '')
    validate = Validate.new
    @player_x = HumanPlayer.new('Player 1', 'X', @inOut)
    @player_o = HumanPlayer.new('Player 2', 'O', @inOut)
    @board = Board.new(@inOut, validate)
    game = Game.new(@inOut, @player_x, @player_o, @board)
    allow(game.inOut).to receive(:gets).and_return('1', '2', '3', '4', '6', '5', '7', '9', '8')
    game.go
    expect(game.winner).to eq false
    expect(game.current_player.mark).to eq 'O'
  end
end
