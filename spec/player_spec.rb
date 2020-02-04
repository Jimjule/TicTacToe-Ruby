require 'player'

# frozen_string_literal: true

describe Player do
  before(:each) do
    @player = Player.new
  end

  it 'Starts with player O' do
    expect(@player.current_player).to eq 'O'
  end

  it 'Can change to player X' do
    expect { @player.change_player }.to output("X's turn\n").to_stdout
  end
end
