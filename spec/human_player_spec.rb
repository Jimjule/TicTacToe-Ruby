require 'human_player'

describe Human_player do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:in_out) { Console_in_out.new(input, output) }
  let(:player) { Human_player.new('Player 1', 'X', in_out) }

  it 'Knows player name' do
    expect(player.id).to eq('Player 1')
  end

  it 'Knows their mark' do
    expect(player.mark).to eq('X')
  end

  it 'Can make a move' do
    board = Board.new
    allow(input).to receive(:gets).and_return('3')
    expect(player.select_move(board)).to eq(2)
  end

  it 'Does not submit squares that do no exist' do
    board = Board.new
    allow(input).to receive(:gets).and_return('-30', '12', '3')
    expect(player.select_move(board)).to eq(2)
  end
end
