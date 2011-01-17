# TODO make this more "Pragmatic Programmer"
if defined?(Rails)
  require "active_model"
  require "active_record"
  require "orochi/acts_as_routeable"
  require "orochi/railtie.rb" if defined?(Rails)
  
  if defined?(ActiveRecord::Base)
    Orochi::ActsAsRouteable.include ActiveRecord::Base
  end
end

module Orochi
  class GoogleClient
    def self.request(options = {})
      # TODO create request string, make request, return JSON
    end
  end
end
