require 'game'

describe Game do

  before(:each) do
    @input = ConsoleInOut.new
  end

  it "Can call X 'Player 1'" do
    allow_any_instance_of(ConsoleInOut).to receive(:gets).and_return('Player 1')
    board = Board.new(3, true)
    player_x = Player.new(@input.get_player_name('X'), 'X')
    player_o = Player.new('Player 2', 'O')
    game = Game.new(true, @input, player_x, player_o, board)
    allow(game.input).to receive(:gets).and_return('1', '2', '3', '4', '6', '5', '7', '9', '8')
    expect(game.player_x.id).to eq 'Player 1'
  end

  it "Can call O 'Player 2'" do
    player_o = Player.new('Player 2', 'O')
    expect(player_o.id).to eq 'Player 2'
  end
end
