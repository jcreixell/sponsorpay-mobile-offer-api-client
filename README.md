SponsorPay Mobile Offer API Client
==================================

[![Build Status](https://travis-ci.org/jcreixell/sponsorpay-mobile-offer-api-client.png?branch=master)](https://travis-ci.org/jcreixell/sponsorpay-mobile-offer-api-client)
[![Code Climate](https://codeclimate.com/github/jcreixell/sponsorpay-mobile-offer-api-client.png)](https://codeclimate.com/github/jcreixell/sponsorpay-mobile-offer-api-client)


Setup
-----

Clone the repository:

    git clone git://github.com/jcreixell/sponsorpay-mobile-offer-api-client.git
    cd sponsorpay-mobile-offer-api-client

Create .env file (see example.env)

Install the required gems:

    bundle

Run the tests:

    rake

Usage
-----

Run the server:

    bundle exec thin -R config.ru -p 5000 start

Point your browser to localhost:5000

License
-------

SponsorPay Mobile Offer API Client is free software, and may be redistributed under the terms
specified in the MIT-LICENSE file.
