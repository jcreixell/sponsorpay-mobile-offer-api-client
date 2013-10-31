require 'acceptance_helper'

feature "Query page" do

  scenario "Visit query page" do
    visit '/'
    page.should have_content 'SponsorPay Mobile Offer API Client'
  end

end
