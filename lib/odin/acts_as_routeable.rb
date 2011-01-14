require 'net/https'
require 'open-uri'

module Odin
  module ActsAsRouteable
    def self.include(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def acts_as_routeable(options = {})
        metaclass = (class << self; self; end)

        belongs_to :router

        send :include, Odin::ActsAsRouteable::InstanceMethods 
      end
    end
    
    module InstanceMethods
      def find_gdirections
        request_str = "http://maps.googleapis.com/maps/api/directions/json?sensor=false&alternatives=true&"
        request_str += "origin=#{CGI::escape(self.router.start)}"
        request_str += "destination=#{CGI::escape(self.router.stop)}"
        response = open(request_str)
        return JSON.parse(response.read)
      end

      # TODO copy functionality from reroute
      def populate_polylines
      end

      def routes
        self.router.routes
      end
    end
  end
end
