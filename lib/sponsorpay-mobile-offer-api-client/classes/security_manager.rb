module SponsorpayMobileOfferApiClient
  class SecurityManager

    def self.query_signature(query, api_key)
      query_params = query.keys.sort.map{ |key| "#{key}=#{query[key]}" }
      hash_key_for(query_params, api_key)
    end

    def self.verify_response(body, api_key, signature)
      Digest::SHA1.hexdigest(body + api_key) == signature
    end

    private

    def self.hash_key_for(query_params, api_key)
      params = query_params + [api_key]
      Digest::SHA1.hexdigest(params.join('&'))
    end

  end
end
