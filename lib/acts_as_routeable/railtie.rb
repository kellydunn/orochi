require 'rails'
require 'acts_as_routeable'

module ActsAsRouteable
  class Railtie < Rails::Railtie
    config.to_preapre do
      ActiveRecord::Base.send(:include, ActsAsRouteable::Hook) 
    end
  end
end
