require 'input'
# frozen_string_literal: true

describe Input do
  it 'Does not throw errors' do
    expect { Input.new }.not_to raise_error
  end
end
