require "spec_helper"

module SponsorpayMobileOfferApiClient
  describe SecurityManager do

    let(:api_key) { 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3' }

    describe "query_signature" do
      let(:query) {
        {
          param1: 'param1',
          param2: 'param2',
          param3: 'param3'
        }
      }

      it "returns a hash key based on the query parameters" do
        SecurityManager.query_signature(query, api_key).should == '8e272c5160714a3872c3068b02a142a3c3e81b8d'
      end
    end

    describe "verify_response" do
      let(:body) { 'test body' }

      context "with valid response" do
        let(:signature) { '6451ead806bcee3c7e7e2d752b6e3d6566f6d5a2' }

        it "returns true" do
          SecurityManager.verify_response(body, api_key, signature).should be_true
        end
      end

      context "with invalid response" do
        let(:signature) { 'xxxxead806bcee3c7e7e2d752b6e3d6566f6d5a2' }

        it "returns false" do
          SecurityManager.verify_response(body, api_key, signature).should be_false
        end
      end
    end

  end
end
