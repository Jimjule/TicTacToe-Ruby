require 'player'

describe Player do
  it 'Does not throw errors' do
    expect { Player.new('Player 1', 'X') }.not_to raise_error
  end
end
