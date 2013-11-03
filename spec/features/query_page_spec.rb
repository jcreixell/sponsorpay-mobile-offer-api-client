require 'acceptance_helper'

feature "Query page" do

  scenario "Visit query page" do
    visit '/'
    page.should have_field 'uid'
    page.should have_field 'pub0'
    page.should have_field 'page'
  end

end
