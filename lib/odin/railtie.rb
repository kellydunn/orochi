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
        task :awaken => :environment do
          puts "===ODIN AWAKENS==="
          system("rails g odin")
          system("rake db:migrate")
          puts "===ARISE, ODIN!==="
        end
      end
    end
  end
end
