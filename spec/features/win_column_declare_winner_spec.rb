require 'player'

describe Player do
    it 'Declares X is the winner' do
        player = Player.new
        allow(player.board).to receive(:gets).and_return('1', '2', '4', '5', '7', '8', '3', '6', '9')
        expect { player.go }.to output('X is the winner!').to_stdout 
    end
end