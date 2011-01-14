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
    
      #TODO copy functionality from reroute
      def find_gdirections
        start = self.router.start
        stop = self.router.stop
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
