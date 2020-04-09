require 'validate'

describe Validate do
  it 'Validates player name' do
    validate = Validate.new
    input = 'Player 1'
    expect(validate.is_valid_player_name?(input)).to eq true
  end

  it 'Invalidates empty player name' do
    validate = Validate.new
    input = ''
    expect(validate.is_valid_player_name?(input)).to eq false
  end

  it 'Invalidates long player name' do
    validate = Validate.new
    input = 'Playerplayerplayerplayerplayerplayerplayerplayerplayerplayer'
    expect(validate.is_valid_player_name?(input)).to eq false
  end

  it 'Validates board size' do
    validate = Validate.new
    input = 3
    expect(validate.is_valid_board_size?(input)).to eq true
  end

  it 'Invalidates negative board size' do
    validate = Validate.new
    input = -1
    expect(validate.is_valid_board_size?(input)).to eq false
  end

  it 'Validates player input' do
    validate = Validate.new
    input = 1
    max_turns = 9
    expect(validate.is_valid_player_input?(input, max_turns)).to eq true
  end

  it 'Invalidates player input greater than board size' do
    validate = Validate.new
    input = 10
    max_turns = 9
    expect(validate.is_valid_player_input?(input, max_turns)).to eq false
  end
end
