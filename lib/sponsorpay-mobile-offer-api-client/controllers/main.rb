module SponsorpayMobileOfferApiClient
  class App < Sinatra::Base

    get '/' do
      haml :query
    end

    post '/' do
      @uid = params['uid']
      @pub0 = params['pub0']
      @page = params['page']

      query = {
        appid: ENV['APP_ID'],
        uid: @uid,
        ip: ENV['IP'],
        locale: ENV['LOCALE'],
        device_id: ENV['DEVICE_ID'],
        pub0: @pub0,
        timestamp: Time.now.utc.to_i,
        offer_types: ENV['OFFER_TYPES'],
      }

      result = HTTParty.get @page,
        query: SponsorpayMobileOfferApiClient::QueryBuilder.build_signed_query(query, ENV['API_KEY'])

      p result

      haml :result
    end

  end
end
