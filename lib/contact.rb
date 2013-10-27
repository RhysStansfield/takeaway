require 'twilio-ruby'

class Contact

  attr_reader :account_sid, :auth_token, :number, :customer_number, :client

  def initialize
    @account_sid = 'ACbd96b4100740f04a0080489e593d7420'
    @auth_token = '766516d22cd1f84a22317f5d198914aa'
    @number = '+441375352009'
    @customer_number = '07887750814'
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def time
    time = Time.new
  end

  def default_body
    "Thanks for ordering, your food will be with you before #{time + 3600}"
  end

  def send_sms from, to, body
    @client.account.messages.create(:from=>from, :to=>to, :body=>body)
  end

end


