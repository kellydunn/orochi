# TODO make this more "Pragmatic Programmer"
require 'net/https'
require 'open-uri'
require 'json'

if defined?(Rails)
  require "active_model"
  require "active_record"
  require "orochi/acts_as_routeable"
  require "orochi/railtie.rb" if defined?(Rails)
  
  if defined?(ActiveRecord::Base)
    Orochi::ActsAsRouteable.include ActiveRecord::Base
  end
end

module Orochi
  class GoogleClient
    def self.request(options = {})
      request_str = "http://maps.googleapis.com/maps/api/directions/json?"
    
      # TODO make settings for default request
      request_str += "sensor=false&"
      request_str += "alternatives=true&"
      
      options.each do |k, v|
        request_str += "&#{k}=#{v}"
      end

      response = open(request_str)
      return JSON.parse(response.read)
    end
  end
end
