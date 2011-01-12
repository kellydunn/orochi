require 'rails'
require 'acts_as_routeable'

module ActsAsRouteable
  class Railtie < Rails::Railtie
    config.to_preapre do
      ApplicationController.send(:extend, ActsAsRouteable::Hook) 
    end
  end
end
