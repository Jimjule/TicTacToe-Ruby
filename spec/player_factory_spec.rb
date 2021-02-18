require 'player_factory'

describe Player_factory do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }

  before(:each) do
    @in_out = Console_in_out.new(input, output)
  end

  it 'Returns a Human Player' do
    expect(Player_factory.generate('X', false, @in_out, 'Test Player')).to be_kind_of(Human_player)
  end

  it 'Returns a Computer Player' do
    expect(Player_factory.generate('O', true, @in_out, 'Test Computer')).to be_kind_of(Computer_player)
  end
end
