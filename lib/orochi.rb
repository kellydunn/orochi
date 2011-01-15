require "active_model"
require "active_record"

require "orochi/acts_as_routeable"

require "orochi/railtie.rb" if defined?(Rails)

if defined?(ActiveRecord::Base)
  Orochi::ActsAsRouteable.include ActiveRecord::Base
end
