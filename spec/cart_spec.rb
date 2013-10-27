require 'cart'

describe Cart do

  let(:cart) { Cart.new }

  it 'has a cart' do
    expect(cart.cart).to be_a_kind_of Hash
  end

  it 'can add an item to the cart from the menu' do
    cart.add :burger
    expect(cart.cart).to eq({{:burger=>2.00}=>1})
  end

  it 'can add multiple items to the menu' do
    cart.add :burger
    cart.add :chips
    expect(cart.cart).to eq({{:burger=>2.00}=>1, {:chips=>1.00}=>1})
  end

  it 'can add multiple of the same item to the menu' do
    cart.add :burger
    cart.add :burger
    cart.add :burger
    expect(cart.cart).to eq({{:burger=>2.0}=>3})
  end

  it 'can add the quantities of items to the items hash' do
    cart.add :chips
    cart.add :chips
    cart.add :burger
    expect(cart.cart_with_counts).to eq([{:chips=>1.00, :quantity=>2}, {:burger=>2.00, :quantity=> 1}])
  end

  it 'can add up costs of individual items' do
    cart.add :burger
    cart.add :chips
    expect(cart.total).to eq 3.00
  end

  it 'can multiply duplicate items to get their total cost' do
    cart.add :burger
    cart.add :burger
    expect(cart.total).to eq 4.00
  end

  it 'can multiply several differt items that are duplicated' do
    cart.add :chips
    cart.add :chips
    cart.add :burger
    cart.add :burger
    expect(cart.total).to eq 6.00
  end

end