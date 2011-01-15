require 'net/https'
require 'open-uri'
require 'json'
require 'googlemaps_polyline/version'
require 'googlemaps_polyline/core'

module Orochi
  module ActsAsRouteable
    def self.include(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def acts_as_routeable(options = {})
        metaclass = (class << self; self; end)

        belongs_to :router

        send :include, Orochi::ActsAsRouteable::InstanceMethods 
      end
    end
    
    module InstanceMethods
      def request_routes
        request_str = "http://maps.googleapis.com/maps/api/directions/json?sensor=false&alternatives=true&"

        start = self.router.start
        request_str += "origin=#{CGI::escape(start)}&"

        stop = self.router.stop
        request_str += "destination=#{CGI::escape(stop)}"

        response = open(request_str)
        return JSON.parse(response.read)
      end


      def route!
        json = self.request_routes
        json_routes = json["routes"]
        json_routes.each do |route|
          r = self.router.routes.create!

          route["legs"].each do |route_leg|
            l = r.legs.create!

            route_leg["steps"].each do |leg_step|
              s = l.steps.create!

              leg_points = leg_step["polyline"]["points"]
              leg_levels = leg_step["polyline"]["levels"]
              polyline_data = GoogleMapsPolyline.decode_polyline(leg_points, leg_levels)
              
              # TODO use inject
              polyline = []
              polyline_data.collect do |point|
                polyline.push([point[0], point[1]])
              end
              
              s.polyline_json = polyline
              s.directions_json = leg_step["html_instructions"]
              s.save!
            end
          end
        end
      end

      def routes
        self.router.routes
      end
    end
  end
end
