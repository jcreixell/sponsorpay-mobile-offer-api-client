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
      query.merge! hashkey: SecurityManager.query_signature(query, ENV['API_KEY'])

      response = HTTParty.get @page, query: query
      raise Errors::InvalidSignatureError unless SecurityManager.verify_response(
        response.body, 
        ENV['API_KEY'], 
        response.headers['X-Sponsorpay-Response-Signature'])
      @offers = JSON.parse(response.body)['offers']
      haml :result
    end

  end
end
