require 'human_player'

describe Human_player do
  let(:player) { Human_player.new('Player 1', 'X') }

  it 'Knows player name' do
    expect(player.id).to eq('Player 1')
  end

  it 'Knows their mark' do
    expect(player.mark).to eq('X')
  end

  it 'Can select a move' do
    board = Board.new
    expect(player.select_move(board, 2)).to eq(2)
  end
end
