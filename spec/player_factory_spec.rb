require 'player_factory'

describe Player_factory do
  it 'Returns a Human Player' do
    expect(Player_factory.generate('X', false, 'Test Player')).to be_kind_of(Human_player)
  end

  it 'Returns a Computer Player' do
    expect(Player_factory.generate('O', true, 'Test Computer')).to be_kind_of(Computer_player)
  end
end
