root = ::File.dirname(__FILE__)
require ::File.join( root, 'lib/sponsorpay-mobile-offer-api-client' )

# load environment
if Sinatra::Base.development?
  if File.exists? "#{root}/.env"
    IO.readlines("#{root}/.env").map{ |line| line.split('=', 2).map(&:strip) }.each do |(key, value)|
      ENV[key] = value
    end
  end
end

run SponsorpayMobileOfferApiClient::App
