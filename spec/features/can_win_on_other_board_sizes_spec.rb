require 'game'

# frozen_string_literal: true

describe Game do
  it 'Win with row 4x4' do
    game = Game.new(4)
    allow(game.board).to receive(:gets).and_return('9', '2', '5', '3', '8', '4', '6', '1')
    game.go
    expect(game.winner).to be true
  end

  it 'Win with column 5x5' do
    game = Game.new(5)
    allow(game.board).to receive(:gets).and_return('1', '2', '6', '5', '11', '12', '21', '17', '16', '22')
    game.go
    expect(game.winner).to be true
  end
  
  it 'Win with column 7x7' do
    game = Game.new(7)
    allow(game.board).to receive(:gets).and_return('1', '2', '9', '5', '17', '12', '25', '18', '33', '22', '41', '30', '49')
    game.go
    expect(game.winner).to be true
  end
end
