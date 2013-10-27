require 'contact'

describe Contact do

  let(:contact) { Contact.new }

  context 'Set up' do

    it 'has an account SID' do
      expect(contact.account_sid).to be_a_kind_of String
    end
  
      it 'has the correct SID' do
        expect(contact.account_sid).to eq 'ACbd96b4100740f04a0080489e593d7420'
      end
  
      it 'has an authorisation token' do
        expect(contact.auth_token).to be_a_kind_of String
      end
  
      it 'has the correct authorisation token' do
        expect(contact.auth_token).to eq '766516d22cd1f84a22317f5d198914aa'
      end

      it 'has a number to send an SMS from' do
        expect(contact.number).to be_a_kind_of String
      end

      it 'has the correct number' do
        expect(contact.number).to eq '+441375352009'
      end

      it 'has a customers number to SMS to' do
        expect(contact.customer_number).to be_a_kind_of String
      end

      it 'has the correct customers number' do
        expect(contact.customer_number).to eq '07887750814'
      end
  
      it 'has a client for connecting to the Twilio API' do
        expect(contact.client).to be_a_kind_of Twilio::REST::Client
      end

      it 'has a default body' do
        expect(contact.default_body).to be_a_kind_of String
      end

  end

end