require 'input'

describe ConsoleInOut do
  it 'Does not throw errors' do
    expect { ConsoleInOut.new }.not_to raise_error
  end
end
