require 'game'

describe Game do

  before(:each) do
    @input = ConsoleInOut.new('', '')
  end

  it "Can call X 'Player 1'" do
    board = Board.new(@input, 3, true)
    player_x = Player.new('Player 1', 'X')
    player_o = Player.new('Player 2', 'O')
    game = Game.new(@input, player_x, player_o, board)
    allow(game.inOut).to receive(:gets).and_return('1', '2', '3', '4', '6', '5', '7', '9', '8')
    expect(game.player_x.id).to eq 'Player 1'
  end

  it "Can call O 'Player 2'" do
    player_o = Player.new('Player 2', 'O')
    expect(player_o.id).to eq 'Player 2'
  end
end
