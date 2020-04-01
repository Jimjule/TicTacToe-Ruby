require 'game'

describe Game do
  it "Can call X 'Player 1'" do
    allow_any_instance_of(Input).to receive(:gets).and_return('Player 1', 'Player 2', '3')
    input = Input.new
    game = Game.new(true, input)
    allow(game.input).to receive(:gets).and_return('1', '2', '3', '4', '6', '5', '7', '9', '8')
    expect(game.player_x.id).to eq 'Player 1'
  end

  it "Can call O'Player 2'" do
    allow_any_instance_of(Input).to receive(:gets).and_return('Player 1', 'Player 2', '3')
    input = Input.new
    game = Game.new(true, input)
    allow(game.input).to receive(:gets).and_return('1', '2', '3', '4', '6', '5', '7', '9', '8')
    expect(game.player_o.id).to eq 'Player 2'
  end
end
