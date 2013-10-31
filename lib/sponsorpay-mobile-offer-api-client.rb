$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

# load dependencies
require 'sinatra/base'
require "sinatra/reloader"
require 'json'
require 'httparty'

# load app
require 'sponsorpay-mobile-offer-api-client/classes/security_manager'
require 'sponsorpay-mobile-offer-api-client/app'
require 'sponsorpay-mobile-offer-api-client/controllers/main'
