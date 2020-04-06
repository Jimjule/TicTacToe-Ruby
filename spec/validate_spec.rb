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
end
