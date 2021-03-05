require 'computer_player'

describe Computer_player do
  let(:board) { Board.new }
  let(:computer_player) { Computer_player.new }

  it 'Has a default name' do
    expect(computer_player.id).to eq('Computer')
  end

  it 'Always plays O' do
    expect(computer_player.mark).to eq('O')
  end

  it 'Fills an array with free squares' do
    expect(computer_player.get_free_squares(board)).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it 'Can return a number from 1' do
    allow(computer_player).to receive(:select_free_square).and_return(1)
    expect(computer_player.select_move(board)).to eq(1)
  end

  it 'Can return a number up to 9' do
    allow(computer_player).to receive(:select_free_square).and_return(9)
    expect(computer_player.select_move(board)).to eq(9)
  end
end
