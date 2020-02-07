require 'game'
require 'player'
require 'board'

# frozen_string_literal: true

describe Game do
  it 'Ends with player X' do
    allow_any_instance_of(Player).to receive(:gets).and_return('3')
    game = Game.new
    allow(game.board).to receive(:gets).and_return('1', '2', '3', '4', '6', '5', '7', '9', '8')
    game.go
    expect(game.winner).to eq false
    expect(game.player.current_player).to eq 'X'
  end
end
