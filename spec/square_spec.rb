require 'square'

describe Square do
  it 'Has an identity' do
    square = Square.new(5)
    expect(square.id).to eq(5)
  end

  it 'Checks square starts free' do
    square = Square.new(1)
    expect(square.is_square_free?).to eq(true)
  end

  it 'Checks square starts with a value' do
    square = Square.new(1)
    expect(square.value).to eq(1)
  end

  it 'Checks value starts as id' do
    square = Square.new(10000)
    expect(square.value).to eq(10000)
  end

  it 'Updates value when marked' do
    square = Square.new(1)
    square.mark('X')
    expect(square.value).to eq('X')
  end
  
  it 'Checks square is occupied' do
    square = Square.new(1)
    square.mark('X')
    expect(square.is_square_free?).to eq(false)
  end

  it 'Cannot overwrite a marked square' do
    square = Square.new(1)
    square.mark('X')
    square.mark('O')
    expect(square.value).to eq('X')
  end
end
