require 'validate'

describe Validate do
  let(:validate) {Validate.new}

  it 'Validates player name' do
    input = 'Player 1'
    expect(validate.is_valid_player_name?(input)).to eq true
  end

  it 'Invalidates empty player name' do
    input = ''
    expect(validate.is_valid_player_name?(input)).to eq false
  end

  it 'Invalidates player name over 50 chars' do
    input = 'Playerplayerplayerplayerplayerplayerplayerplayerplayerplayer'
    expect(validate.is_valid_player_name?(input)).to eq false
  end

  it 'Validates board size' do
    input = 3
    expect(validate.is_valid_board_size?(input)).to eq true
  end

  it 'Invalidates negative board size' do
    input = -1
    expect(validate.is_valid_board_size?(input)).to eq false
  end

  it 'Validates player input' do
    input = 1
    max_turns = 9
    expect(validate.is_valid_player_input?(input, max_turns)).to eq true
  end

  it 'Invalidates player input greater than board size' do
    input = 10
    max_turns = 9
    expect(validate.is_valid_player_input?(input, max_turns)).to eq false
  end
end
