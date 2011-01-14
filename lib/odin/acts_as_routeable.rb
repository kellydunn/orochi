require 'net/https'
require 'open-uri'

module Odin
  module ActsAsRouteable
    def self.include(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      attr_accessor :start, :stop

      def acts_as_routeable(options = {})
        metaclass = (class << self; self; end)

        # TODO if you have many routes, then
        # we need to have a foreign key of metaclass.class.id
        has_many :routes

        # Just for starters
        self.start = options[:start].nil?? "San Francisco, CA" : options[:start]
        self.start = options[:start].nil?? "Seattle, WA" : options[:start]
        
        send :extend, Odin::ActsAsRouteable::InstanceMethods 
      end
    end
    
    module InstanceMethods
    
      #TODO FUUUU I need to simplify this from an OOP perspective
      def find_gdirections
        request_str = "http://maps.googleapis.com/maps/api/directions/json?sensor=false&alternatives=true&"
        request_str += "origin=#{CGI::escape(self.start)}&"
        request_str += "destination=#{CGI::escape(self.stop)}"
        response = open(request_str)
        return JSON.parse(response.read)
      end

      # TODO reformat this so that we're
      # talking to the same models inside of our gem
      # generated database
      def populate_polylines
        json = find_gdirections
        json_routes = json["routes"]
        
        # for each route
        json_routes.each do |route|
          
          # Create new route

          # for each leg
          route["legs"].each do |route_leg|

            # Create new leg

            # for each step
            route_leg["steps"].each do |leg_step|
              leg_points = leg_step["polyline"]["points"]
              leg_levels = leg_step["polyline"]["levels"]

              # decode polyline for points
              # with res level
              polyline_data = GoogleMapsPolyline.decode_polyline(leg_points, leg_levels)

              # push polyline information
              polyline = []
              polyline_data.collect do |point|
                polyline.push([point[0], point[1]])
              end

              # create step
              Step.create!()
            end
          end
        end
      end
    end
  end
end
