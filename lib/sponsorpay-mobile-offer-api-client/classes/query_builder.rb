module SponsorpayMobileOfferApiClient
  class QueryBuilder

    def self.build_signed_query(query, key)
      query_params = query.keys.sort.map{ |key| "#{key}=#{query['key']}" }
      query_params << key
      hash_key = Digest::SHA1.hexdigest(query_params.join('&'))
      query_params << "hash_key=#{hash_key}"
      query_params
    end

  end
end
