require 'rspec'
require 'orochi'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/helpers/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
end
