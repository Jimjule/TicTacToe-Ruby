require 'consoleInOut'

describe ConsoleInOut do
  it 'Does not throw errors' do
    expect { ConsoleInOut.new(STDIN, STDOUT) }.not_to raise_error
  end

  it 'Can mock input and output' do
    input = "It's a string!"
    output = []
    consoleInOut = ConsoleInOut.new(input, output)
    consoleInOut.write(input)
    expect(consoleInOut.output[0]).to eq("It's a string!")
  end
end
