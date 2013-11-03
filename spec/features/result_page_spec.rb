require 'acceptance_helper'

feature "Result page" do

  given(:uid) { "player1" }
  given(:pub0) { "campaign2" }
  given(:url) { "http://api.sponsorpay.com/feed/v1/offers.json" }
  given(:timestamp) { Time.at(1383435028) }
  given(:response) { File.read("spec/support/response.json") }
  given(:response_signature) { Digest::SHA1.hexdigest(response + ENV['API_KEY']) }

  given(:query_parameters) {
    {
      appid: ENV['APP_ID'],
      uid: uid,
      ip: ENV['IP'],
      locale: ENV['LOCALE'],
      device_id: ENV['DEVICE_ID'],
      pub0: pub0,
      timestamp: timestamp.to_i,
      offer_types: ENV['OFFER_TYPES'],
      hashkey: 'abe806ae2283c416716690447493418aa638f058'
    }
  }

  background do
    Time.stub(:now).and_return(timestamp)

    stub_request(:get, url).
    with(:query => query_parameters).
    to_return(body: response, status: 200, headers: {'X-Sponsorpay-Response-Signature' => response_signature})
  end

  scenario "Submit form" do
    visit '/'
    fill_in 'UID', :with => 'player1'
    fill_in 'Pub0', :with => 'campaign2'
    fill_in 'Page', :with => 'http://api.sponsorpay.com/feed/v1/offers.json'
    click_button 'Submit'
    page.should have_content "Tap Fish"
    page.should have_content "90"
    page.should have_xpath "//img[@src='http://cdn.sponsorpay.com/assets/1808/icon175x175-2_square_60.png']"
  end

end
