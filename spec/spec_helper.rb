ENV['RACK_ENV'] = 'test'

require_relative '../lib/sponsorpay-mobile-offer-api-client'

require 'rspec'
require 'rack/test'
require 'webmock/rspec'

def app
  SponsorpayMobileOfferApiClient::App
end

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before(:suite) do
    WebMock.disable_net_connect!(:allow_localhost => true)

    IO.readlines("test.env").map{ |line| line.split('=', 2).map(&:strip) }.each do |(key, value)|
      ENV[key] = value
    end
  end

end
