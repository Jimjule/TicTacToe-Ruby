require 'human_player'
require 'console_in_out'

describe Human_player do

  let(:output) { StringIO.new }
  let(:player_move) { '3' }
  let(:in_out) { ConsoleMock.new(player_move, output) }
  let(:player) { Human_player.new('Player 1', 'X', in_out) }

  it 'Knows player name' do
    expect(player.id).to eq('Player 1')
  end

  it 'Knows their mark' do
    expect(player.mark).to eq('X')
  end

  it 'Can make a move' do
    expect(player.make_move(9)).to eq(2)
  end
end
