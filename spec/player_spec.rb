require 'player'

describe Player do
    before(:each) do
        @player = Player.new
    end

    it 'Starts with player O' do
        expect(@player.current_player).to eq 'O'
    end

    # it 'Can select a move' do
    #     allow(@player).to receive(:gets).and_return('1')
    #     player_input = 1
    #     row = (player_input - 1) / 3
    #     column = (player_input - 1) % 3
    #     @board.make_move(player_input, row, column)
    #     expect(@player.square).to eq(1)
    # end

    it 'Can change to player X' do
        expect { @player.change_player }.to output("X's turn\n").to_stdout
    end

    it 'Starts with player O' do
        expect(@player.current_player).to eq 'O'
    end
end
