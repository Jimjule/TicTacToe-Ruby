require 'game'

describe Game do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }

  before(:each) do
    @in_out = Console_in_out.new(input, output)
    @player_x = Human_player.new('Player 1', 'X', @in_out)
    @player_o = Human_player.new('Player 2', 'O', @in_out)
    board = Board.new
    game = Game.new(@in_out, @player_x, @player_o, board)
    @game_controller = Game_controller.new(game)
  end

  it 'Has a method to control the game flow' do
    expect(@game_controller).to respond_to(:go)
  end

  it 'Contains a game instance' do
    expect(@game_controller.game).to be_a_kind_of(Game)
  end
end
