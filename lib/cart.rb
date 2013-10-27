class Cart

  def initialize
    @cart = Hash.new 0
    @menu = Menu.new
  end

  def cart
    @cart
  end

  def menu
    @menu.menu
  end

  def add item
    menu.each do |dish|
      cart[dish] += 1 if dish.include? item
    end
  end 

  def cart_with_counts
    cart_with_counts = []
    cart.each_key do |dish|
      dish[:quantity] = cart[dish]
      cart_with_counts << dish
    end
    cart_with_counts
  end

  def total
    totals_of_each_dish = []
    cart_with_counts.each { |dish| totals_of_each_dish << multiples(dish) }
    totals_of_each_dish.inject(:+)
  end

  def multiples dish
    numbers = []
    dish.each_value { |value| numbers << value }
    numbers.inject(:*)
  end

end