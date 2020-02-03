require 'player'

describe Player do
    it 'Can win diagonally' do
        player = Player.new
        allow(player.board).to receive(:gets).and_return('9', '2', '5', '3', '1', '4', '6', '7', '8')
        player.go
        expect(player.winner).to be true
    end
end