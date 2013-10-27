require 'menu'

describe Menu do

  let(:menu) { Menu.new }

  it 'Has a menu' do
    expect(menu.menu).to be_a_kind_of Array
  end

  it 'Has several items on the menu' do
    expect(menu.menu.count).to be > 1
  end

  it 'Has names for each item on the menu' do
    expect(menu.menu.first.has_key?(:burger)).to be_true
  end

  it 'Has a price for each item on the menu' do
    expect(menu.menu.first[:burger]).to eq 2.00
  end

end