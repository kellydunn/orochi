require "active_model"
require "active_record"

$LOAD_PATH.unshift(File.dirname(__FILE__))

require "odin/acts_as_routeable"

$LOAD_PATH.shift

if defined?(ActiveRecord::Base)
  Odin::ActsAsRouteable.include ActiveRecord::Base
end
