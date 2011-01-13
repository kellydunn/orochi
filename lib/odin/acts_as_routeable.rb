module Odin

  module ActsAsRouteable
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def acts_as_routeable(options = {})
        metaclass = (class << self; self; end)

        send :extend, Odin::ActsAsRouteable::InstanceMethods 
      end
    end
    
    module InstanceMethods
    end
  end
end
