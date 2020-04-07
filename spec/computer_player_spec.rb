require 'computer_player'

describe Computer_player do
  before(:each) do
    @computer_player = Computer_player.new('')
  end

  it 'Has a default name' do
    expect(@computer_player.id).to eq('Computer')
  end

  it 'Always plays O' do
    expect(@computer_player.mark).to eq('O')
  end

  it 'Can return a number from 0' do
    allow(@computer_player).to receive(:rand).and_return(1)
    expect(@computer_player.make_move(9)).to eq(0)
  end

  it 'Can return a number up to 8' do
    allow(@computer_player).to receive(:rand).and_return(3)
    expect(@computer_player.make_move(9)).to eq(2)
  end
end
