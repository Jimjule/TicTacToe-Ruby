require 'player'
require 'board'

describe Player do
    it 'Ends with player X' do
        player = Player.new
        allow(player.board).to receive(:gets).and_return('1', '2', '3', '4', '6', '5', '7', '9', '8')
        player.go
        expect(player.winner).to eq false
        expect(player.current_player).to eq 'X'
    end
end