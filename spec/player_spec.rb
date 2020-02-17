require 'player'

# frozen_string_literal: true

describe Player do
  it 'Does not throw errors' do
    expect { Player.new }.not_to raise_error
  end
end
