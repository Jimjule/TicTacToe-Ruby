require 'computer_player'

describe ComputerPlayer do

  before(:each) do
    @computer_player = ComputerPlayer.new(inOut)
  end

  it 'Has a default name' do
    expect(@computer_player.id).to eq('Computer')
  end

  it 'Always plays O' do
    expect(@computer_player.mark).to eq('O')
  end

  it 'Can return a number under 9' do
    allow(@computer_player).to receive(:rand).and_return(3)
    expect(@computer_player.make_move(9)).to eq(3)
  end

  it 'Returns a number under 400' do
    allow(@computer_player).to receive(:rand).and_return(133)
    expect(@computer_player.make_move(400)).to eq(133)
  end
end
