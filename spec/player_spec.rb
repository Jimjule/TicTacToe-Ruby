require 'player'

describe Player do
  it 'Stores player name' do
    player = Player.new('Player 1', 'X')
    expect(player.id).to eq('Player 1')
  end

  it 'Stores player name' do
    player = Player.new('Player 1', 'X')
    expect(player.mark).to eq('X')
  end
end
