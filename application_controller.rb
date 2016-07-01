require 'bundler'
require_relative 'models/model.rb'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post "/hub" do
    @days_selected = get_days_selected
    @setting1 = params["optradio_setting1"]
    @setting2 = params["optradio_setting2"]
    @setting3 = params["optradio_setting3"]
    # this creates a new connection to the Twilio API
    @client = Twilio::REST::Client.new('ACed3ed813257f8acedfce46a695216257','cb1dd832eda91ea39319fe6827f1650b')
    # this creates a message and sends it out via Twilio
    if @phone_number
      @phone_number = params["phone_number"]
      @text_message = "You want to go to bed at #{@setting1}. You want to sleep for #{@setting2}. We will wake you up with a #{@setting3}"
      @client.messages.create(
        from: '+14342605034', # this is the Flatiron School's Twilio number
        to: @phone_number,
        body: @text_message
      )
    else
      @text_message = "You want to go to bed at #{@setting1}. You want to sleep for #{@setting2}. We will wake you up with a #{@setting3}"
    end

    erb :hub
  end

  post '/text-message' do

  end

end



#settings - hub.erb
