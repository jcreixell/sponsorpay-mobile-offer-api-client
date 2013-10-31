require 'sinatra/base'
require "sinatra/reloader"
require 'json'
require 'httparty'

require_relative 'helpers/request_format_helper'

class App < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :haml, :format => :html5
  set :json_pretty, true

  helpers RequestFormatHelper

  configure :development do
    require 'pry'
    register Sinatra::Reloader
  end

  get '/' do
    haml :query
  end

  post '/get_offers' do
    @uid = params['uid']
    @pub0 = params['pub0']
    @page = params['page']

    options = {
      appid: ENV['APP_ID'],
      uid: @uid,
      ip: ENV['IP'],
      locale: ENV['LOCALE'],
      device_id: ENV['DEVICE_ID'],
      pub0: @pub0,
      timestamp: Time.now.utc.to_i,
      offer_types: ENV['OFFER_TYPES'],
      hash_key: ENV['API_KEY']
    }

    result = HTTParty.get @page, query: options

    haml :result
  end

end
