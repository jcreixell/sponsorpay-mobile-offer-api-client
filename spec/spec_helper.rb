ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'rack/test'
require 'webmock/rspec'

require_relative '../app'

def app
  App
end

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before(:suite) do
    WebMock.disable_net_connect!(:allow_localhost => true)
  end
end
