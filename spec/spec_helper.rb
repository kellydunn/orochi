$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'odin'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/helpers/**/*.rb"].each {|f| require f}
# Dir[File.expand_path(File.dirname(__FILE__), "spec/helpers/**/*.rb")].each do |file|
#   require file
# end


RSpec.configure do |config|
end
