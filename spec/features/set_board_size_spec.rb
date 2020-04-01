require 'board'

describe Board do
  it 'Can make a 4x4 board' do
    expect { Board.new(4) }.to output("------\n|1234|\n|5678|\n|9101112|\n|13141516|\n------\n").to_stdout
  end

  it 'Can make a 9x9 board' do
    expect { Board.new(6) }.to output("--------\n|123456|\n|789101112|\n|131415161718|\n|192021222324|\n|252627282930|\n|313233343536|\n--------\n").to_stdout
  end
end
