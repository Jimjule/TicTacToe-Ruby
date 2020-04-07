require 'human_player'
require 'console_in_out'

describe HumanPlayer do
  before(:each) do
    inOut = ConsoleMock.new('3', '')
    @player = HumanPlayer.new('Player 1', 'X', inOut)
  end

  it 'Knows player name' do
    expect(@player.id).to eq('Player 1')
  end

  it 'Knows their mark' do
    expect(@player.mark).to eq('X')
  end

  it 'Can make a move' do
    expect(@player.make_move(9)).to eq(3)
  end
end
