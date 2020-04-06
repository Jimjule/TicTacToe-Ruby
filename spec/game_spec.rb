require 'game'

describe Game do

  before(:each) do
    @inOut = ConsoleInOut.new('', '')
    @player_x = Player.new('Player 1', 'X', @inOut)
    @player_o = Player.new('Player 2', 'O', @inOut)
  end

  it 'Returns current player X' do
    board = Board.new(@inOut, 3)
    game = Game.new(@inOut, @player_x, @player_o, board)
    expect(game.current_player).to eq(@player_x)
  end

  it 'Displays a board' do
    board = Board.new(@inOut, 3)
    game = Game.new(@inOut, @player_x, @player_o, board)
    expect(@inOut.output.join).to include("-----|123||456||789|-----")
  end

  it 'Asks for board size input' do
    validate = Validate.new
    board = Board.new(@inOut, validate, 4)
    game = Game.new(@inOut, @player_x, @player_o, board)
    expect(game.board.board_size).to eq 4
  end
end
