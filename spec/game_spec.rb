require 'game'

# frozen_string_literal: true

describe Game do
  it 'Displays a board' do
    allow_any_instance_of(Player).to receive(:gets).and_return('3')
    expect { Game.new }.to output("Please enter the length of a board side\n-----\n|123|\n|456|\n|789|\n-----\nWelcome to TicTacToe\n").to_stdout
  end

  it 'Asks for board size input' do
    allow_any_instance_of(Player).to receive(:gets).and_return('4')
    game = Game.new
    expect(game.board.board_size).to eq 4
  end
end
