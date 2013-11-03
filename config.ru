root = ::File.dirname(__FILE__)
require ::File.join( root, 'lib/sponsorpay-mobile-offer-api-client' )

# load environment
environment_path = "#{root}/#{ENV['RACK_ENV']}.env"
if File.exists? environment_path
  IO.readlines(environment_path).map{ |line| line.split('=', 2).map(&:strip) }.each do |(key, value)|
    ENV[key] = value
  end
end

run SponsorpayMobileOfferApiClient::App
