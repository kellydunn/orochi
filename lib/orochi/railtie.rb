require 'orochi'
require 'rails'

module Orochi
  class Railtie < Rails::Railtie

    generators do
      require File.join(File.dirname(__FILE__), "../generators/orochi/orochi_generator")
    end

    rake_tasks do
      namespace :orochi do

        desc "generates and runs all necessary migrations for orochi"
        task :awaken => :environment do
          puts "===OROCHI AWAKENS==="
          system("rails g orochi")
          system("rake db:migrate")
          puts "===ARISE, OROCHI!==="
        end
      end
    end
  end
end
