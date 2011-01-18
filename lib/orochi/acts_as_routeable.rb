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
      def request_routes(options)
        Orochi::GoogleClient.request(options)
      end


      def route!
        json = self.request_routes({:origin => self.router.start, :destination => self.router.stop})
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
              
              s.polyline_json = polyline.inspect
              s.directions_json = leg_step["html_instructions"]
              s.save!
            end
          end
        end
      end

      def routes
        self.router.routes
      end

      def set_endpoints!(start, stop)
        if self.router.nil?
          self.router = Router.create!
        end
        self.router.start = start
        self.router.stop = stop
        self.router.save!
      end

      def polyline
        polyline = []
        routes.first.each_step do |step|
          polyline.push(step.polyline_json.to_a)
        end
        polyline.flatten
      end

      def directions
        directions = []
        routes.first.each_step do |step|
          directions.push(step.directions_json.to_s)
        end
        directions
      end

      def reverse
        # TODO find_or_create_by
        reversed_router = Router.where({:start => self.router.stop, :stop => self.router.start})
        if reversed_router.nil? || reversed_router.empty?
          reversed_router = Router.create({:start => self.router.stop, :stop => self.router.start})
          reversed_router.route!
        end
        reversed_router
      end

    end
  end
end
