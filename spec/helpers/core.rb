require "spec_helper"

module CoreHelper
  def create_rails_app
    Dir.chdir(File.join(File.dirname(__FILE__), "../staging"))
    system("rails new gem_test -d mysql -m ../../lib/rails_templates/default_template.rb >> /dev/null")
    puts "== Created rails application ====="
    system("pwd")
    require "gem_test/config/environment.rb"
    mock_rails_env
  end
  
  def destroy_rails_app
    begin
      system("rm -rf gem_test")
      puts "== Destroyed rails application ==="
      Dir.chdir("../../")
    rescue
      puts "Was not able to delete rails application"
    end
  end

  def mock_rails_env
    database_yml = File.join(File.dirname(__FILE__), '../staging/gem_test/config/database.yml')
    system("echo #{database_yml}")
    if File.exists?(database_yml)
      active_record_configuration = YAML.load_file(database_yml)["mysql"]
      
      ActiveRecord::Base.establish_connection(active_record_configuration)
      ActiveRecord::Base.logger = Logger.new(File.join(File.dirname(__FILE__), "debug.log"))
      
      ActiveRecord::Base.silence do
        ActiveRecord::Migration.verbose = false
        
        load(File.dirname(__FILE__) + '/../staging/gem_test/db/schema.rb')
        system("pwd")
        Dir.new(File.join(File.dirname(__FILE__), "/../../lib/generators/orochi/templates/models")).each do |file|
          load(file) if !File.directory?(file)          
        end
      end
    else
      system("echo ':('")
    end
  end
end

