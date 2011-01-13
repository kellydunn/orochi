if defined?(Rails)
  require "odin/railtie.rb" 
  require "odin/acts_as_routeable"

  ActiveRecord::Base.send :include, Odin::ActsAsRouteable
end

