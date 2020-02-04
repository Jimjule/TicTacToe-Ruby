require 'player'

# frozen_string_literal: true

describe Player do
  it 'Can win diagonally' do
    player = Player.new
    allow(player.board).to receive(:gets).and_return('9', '2', '5', '3', '1', '4', '6', '7', '8')
    player.go
    expect(player.winner).to be true
  end

  it 'Can win a row' do
    player = Player.new
    allow(player.board).to receive(:gets).and_return('9', '1', '7', '2', '6', '3', '4', '5', '8')
    player.go
    expect(player.winner).to be true
    expect { player.go }.to output('O is the winner!').to_stdout
  end

  it 'Can win a column' do
    player = Player.new
    allow(player.board).to receive(:gets).and_return('1', '2', '4', '5', '7', '8', '3', '6', '9')
    expect { player.go }.to output('X is the winner!').to_stdout
  end
end
