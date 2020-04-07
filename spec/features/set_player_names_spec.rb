require 'game'

describe Game do
  before(:each) do
    @inOut = Console_in_out.new('', '')
  end

  it "Can call X 'Player 1'" do
    player_x = Human_player.new('Player 1', 'X', @inOut)
    expect(player_x.id).to eq 'Player 1'
  end

  it "Can call O 'Player 2'" do
    player_o = Human_player.new('Player 2', 'O', @inOut)
    expect(player_o.id).to eq 'Player 2'
  end
end
