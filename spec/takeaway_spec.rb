require 'takeaway'

describe Takeaway do

  let(:order) { Takeaway.new }

  context 'The menu' do

    it 'Has a menu' do
      expect(order.menu).to be_a_kind_of Array
    end

    it 'Has several items on the menu' do
      expect(order.menu.count).to be > 1
    end

    it 'Has names for each item on the menu' do
      expect(order.menu.first.has_key?(:burger)).to be_true
    end

    it 'Has a price for each item on the menu' do
      expect(order.menu.first[:burger]).to eq 2.00
    end

  end

  context 'Placing an order' do

    it 'Has a cart' do
      expect(order.cart).to be_a_kind_of Hash
    end

    it 'Can add an item to the cart from the menu' do
      order.add :burger
      expect(order.cart).to eq({{:burger=>2.00}=>1})
    end

    it 'Can add multiple items to the menu' do
      order.add :burger
      order.add :chips
      expect(order.cart).to eq({{:burger=>2.00}=>1, {:chips=>1.00}=>1})
    end

    it 'Can add multiple of the same item to the menu' do
      order.add :burger
      order.add :burger
      order.add :burger
      expect(order.cart).to eq({{:burger=>2.0}=>3})
    end

    it 'can multiply several different items that are duplicated' do
      order.add :chips
      order.add :chips
      order.add :burger
      order.add :burger
      expect(order.total).to eq '6.00'
    end

  end

  context 'Checking out' do

    it 'can take a number from the customer - representing cash' do
      expect(order.pay(1)).to eq '1.00'
    end

    it 'can check that customers payment is equal to the total value of the order' do
      order.add :chips
      order.add :burger
      order.pay(3.00)
      expect(order.valid_payment?).to be_true
    end

  end

end