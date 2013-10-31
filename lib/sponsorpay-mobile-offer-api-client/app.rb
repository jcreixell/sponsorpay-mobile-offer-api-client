module SponsorpayMobileOfferApiClient
  class App < Sinatra::Base

    configure do
      set :root, File.dirname(__FILE__)
      set :haml, :format => :html5
      set :json_pretty, true
    end

    configure :development do
      require 'pry'
      register Sinatra::Reloader
    end

  end
end
