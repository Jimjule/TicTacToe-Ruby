require 'player'

describe Player do
    it 'Can win a row' do
        player = Player.new
        allow(player.board).to receive(:gets).and_return('9', '1', '7', '2', '6', '3', '4', '5', '8')
        player.go
        expect(player.winner).to be true
        expect { player.go }.to output("O is the winner!").to_stdout
    end
end