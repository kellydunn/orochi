require "active_model"
require "active_record"

require "odin/acts_as_routeable"

require "odin/railtie.rb" if defined?(Rails)

if defined?(ActiveRecord::Base)
  Odin::ActsAsRouteable.include ActiveRecord::Base
end
