module Odin
  module ActsAsRouteable
    def self.include(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def acts_as_routeable(options = {})
        metaclass = (class << self; self; end)

        # Relationships to make routing work
        belongs_to :route
        
        

        send :extend, Odin::ActsAsRouteable::InstanceMethods 
      end
    end
    
    module InstanceMethods
      
    end
  end
end
