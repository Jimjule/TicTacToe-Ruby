require 'game'

describe Game do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:validate) { Validate.new }

  before(:each) do
    @in_out = Console_in_out.new(input, output, validate)
  end

  it "Can call X 'Player 1'" do
    player_x = Human_player.new('Player 1', 'X', @in_out)
    expect(player_x.id).to eq 'Player 1'
  end

  it "Can call O 'Player 2'" do
    player_o = Human_player.new('Player 2', 'O', @in_out)
    expect(player_o.id).to eq 'Player 2'
  end
end
