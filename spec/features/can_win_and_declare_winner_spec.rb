require 'console_game_controller'
require 'tictactoe_jules'
require 'board'

describe Tictactoe_jules do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }

  before(:each) do
    in_out = Console_in_out.new(input, output)
    player_x = Human_player.new('Player 1', 'X', in_out)
    player_o = Human_player.new('Player 2', 'O', in_out)
    board = Board.new
    tictactoe_jules = Tictactoe_jules.new(player_x, player_o, board)
    @console_game_controller = Console_game_controller.new(tictactoe_jules, in_out)
  end

  it 'Can win diagonally falling' do
    allow(@console_game_controller.in_out.input).to receive(:gets).and_return('9', '2', '5', '3', '1', '4', '6', '7', '8')
    @console_game_controller.go
    expect(@console_game_controller.tictactoe_jules.turn_count).to eq 5
    expect(@console_game_controller.tictactoe_jules.winner).to be true
  end

  it 'Can win diagonally rising' do
    allow(@console_game_controller.in_out.input).to receive(:gets).and_return('9', '5', '2', '7', '1', '4', '6', '3', '8')
    @console_game_controller.go
    expect(@console_game_controller.tictactoe_jules.turn_count).to eq 8
    expect(@console_game_controller.tictactoe_jules.winner).to be true
  end

  it 'Can win a row' do
    allow(@console_game_controller.in_out.input).to receive(:gets).and_return('9', '1', '7', '2', '6', '3', '4', '5', '8')
    @console_game_controller.go
    expect(@console_game_controller.tictactoe_jules.turn_count).to eq 6
    expect(@console_game_controller.tictactoe_jules.winner).to eq true
  end

  it 'Can win a column' do
    allow(@console_game_controller.in_out.input).to receive(:gets).and_return('1', '2', '4', '5', '7', '8', '3', '6', '9')
    @console_game_controller.go
    expect(@console_game_controller.tictactoe_jules.turn_count).to eq 5
    expect(@console_game_controller.tictactoe_jules.winner).to be true
  end

  it 'Can win with the second column' do
    allow(@console_game_controller.in_out.input).to receive(:gets).and_return('8', '1', '5', '4', '2', '6', '7', '3', '9')
    @console_game_controller.go
    expect(@console_game_controller.tictactoe_jules.turn_count).to eq 5
    expect(@console_game_controller.tictactoe_jules.winner).to be true
  end
end
