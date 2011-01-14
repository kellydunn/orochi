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
        belongs_to :router

        # Just for starters        
        send :extend, Odin::ActsAsRouteable::InstanceMethods 
      end
    end
    
    module InstanceMethods
    
      #TODO copy functionality from reroute
      def find_gdirections
      end

      # TODO copy functionality from reroute
      def populate_polylines
      end

    end
  end
end
