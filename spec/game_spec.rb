require 'game'

describe Game do
  before(:each) do
    @in_out = Console_in_out.new('', '')
    @player_x = Human_player.new('Player 1', 'X', @in_out)
    @player_o = Human_player.new('Player 2', 'O', @in_out)
  end

  it 'Returns current player X' do
    board = Board.new(@in_out, 3)
    game = Game.new(@in_out, @player_x, @player_o, board)
    expect(game.current_player).to eq(@player_x)
  end

  it 'Displays a board' do
    board = Board.new(@in_out, 3)
    game = Game.new(@in_out, @player_x, @player_o, board)
    expect(@in_out.output.join).to include("-----|123||456||789|-----")
  end

  it 'Asks for board size input' do
    validate = Validate.new
    board = Board.new(@in_out, validate, 4)
    game = Game.new(@in_out, @player_x, @player_o, board)
    expect(game.board.board_size).to eq 4
  end
end
