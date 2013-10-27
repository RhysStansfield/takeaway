require 'twilio-ruby'
require_relative 'cart'
require_relative 'menu'
require_relative 'contact'
require_relative 'bad_payment'

class Takeaway

  def initialize
    @cart = Cart.new
    @contacter = Contact.new
  end

  def menu
    @cart.menu
  end

  def cart
    @cart.cart
  end

  def add item
    item = item.to_sym
    @cart.add item
  end

  def total
    '%.2f' % @cart.total
  end

  def send_sms from, to, body
    @contacter.send_sms from, to, body
  end

  def pay number
    @customer_payment = '%.2f' % number.to_f
  end

  def valid_payment?
    @customer_payment == total
  end


  def checkout
    puts 'Enter amount to pay:'
    payment = gets.chomp!
    begin
      pay payment
      raise BadPaymentError unless valid_payment?
    rescue BadPaymentError
      puts 'Ooops, incorrect amount entered, please try again:'
      checkout
    end
    send_sms(@contacter.number, @contacter.customer_number, @contacter.default_body)
  end


end
