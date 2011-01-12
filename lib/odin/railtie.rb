require 'odin'
require 'rails'

module Odin
  class Railtie < Rails::Railtie

    generators do
      require File.join(File.dirname(__FILE__), "../generators/odin/odin_generator")
    end

    rake_tasks do
      namespace :odin do
        desc "runs all necessary database migrations to operate squire"
        task :init do
          puts "TODO database migrations"
        end
      end
    end
  end
end
