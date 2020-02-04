require 'game'

# frozen_string_literal: true

describe Game do
  it 'Displays a board' do
    expect { Game.new }.to output("-----\n|123|\n|456|\n|789|\n-----\nWelcome to TicTacToe\n").to_stdout
  end
end
