require 'active_record'
require 'active_support/core_ext'

require File.join(File.dirname(__FILE__), "acts_as_routeable/railtie")

module ActsAsRouteable
  autoload :Hook, File.join(File.dirname(__FILE__), "acts_as_routeable/hook")
  autoload :InstanceMethods. File.join(File.dirname(__FILE__), "acts_as_routeable/instance_methods")
end
