require "spec_helper"

module CoreHelper
  def create_rails_app
    Dir.chdir("spec/staging")
    system("rails new gem_test -d mysql -m ../../lib/rails_templates/default_template.rb >> /dev/null")
    puts "== Created rails application ====="
    require "../staging/gem_test/config/environment.rb"
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
    database_yml = File.expand_path('../database.yml', __FILE__)
    if File.exists?(database_yml)
      active_record_configuration = YAML.load_file(database_yml)["mysql"]
      
      ActiveRecord::Base.establish_connection(active_record_configuration)
      ActiveRecord::Base.logger = Logger.new(File.join(File.dirname(__FILE__), "debug.log"))
      
      ActiveRecord::Base.silence do
        ActiveRecord::Migration.verbose = false
        
        load(File.dirname(__FILE__) + '/schema.rb')
        load(File.dirname(__FILE__) + '/models.rb')
      end
    end
  end
end

