require 'active_record'
require 'acts_as_routeable/acts_as_routeable'

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend ActsAsRouteable
  ActiveRecord::Base.send :include, ActsAsRouteable
end
