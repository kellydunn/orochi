module Odin

  module ActsAsRouteable
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
    end
    
    module InstanceMethods
    end
  end
end
