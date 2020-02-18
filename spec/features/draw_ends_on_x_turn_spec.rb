require 'game'
require 'player'
require 'board'

# frozen_string_literal: true

describe Game do
  it 'Ends with player X' do
    allow_any_instance_of(Input).to receive(:gets).and_return('Player 1', 'Player 2', '3')
    game = Game.new
    allow(game.input).to receive(:gets).and_return('1', '2', '3', '4', '6', '5', '7', '9', '8')
    game.go
    expect(game.winner).to eq false
    expect(game.current_player.mark).to eq 'O'
  end
end
