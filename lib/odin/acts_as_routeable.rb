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

        # TODO if you have many routes, then
        # we need to have a foreign key of metaclass.class.id
        has_many :routes
        
        send :extend, Odin::ActsAsRouteable::InstanceMethods 
      end
    end
    
    module InstanceMethods
    
      #TODO FUUUU I need to simplify this from an OOP perspective
      def find_gdirections
=begin
        request_str = "http://maps.googleapis.com/maps/api/directions/json?sensor=false&alternatives=true&"
        request_str += "origin=#{CGI::escape(self.start)}&"
        request_str += "destination=#{CGI::escape(self.stop)}"
        response = open(request_str)
        return JSON.parse(response.read)
=end
      end

      # TODO reformat this so that we're
      # talking to the same models inside of our gem
      # generated database
      def populate_polylines
        json = find_gdirections
        json_routes = json["routes"]
        json_routes.each do |route|
          polyline = []
          route["legs"].each do |route_leg|
            route_leg["steps"].each do |leg_step|
              leg_points = leg_step["polyline"]["points"]
              leg_levels = leg_step["polyline"]["levels"]
              polyline_data = GoogleMapsPolyline.decode_polyline(leg_points, leg_levels)
              polyline_data.collect do |point|
                polyline.push([point[0], point[1]])
              end
            end
            polylines.create(:path_json => polyline.inspect)
          end
        end
      end
    end
  end
end
