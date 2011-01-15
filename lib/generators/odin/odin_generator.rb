require 'rails/generators'
require 'rails/generators/migration'

# TODO seperating this content seems to
# render all generators un-find-able :\
class OdinGenerator < Rails::Generators::Base
  source_root(File.join(File.dirname(__FILE__)))

  # Migrations
  include Rails::Generators::Migration

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end
  
  def create_migration_file
    migration_template File.join(File.dirname(__FILE__), 'templates/migrations/migration.rb'), 'db/migrate/odin_migration'
  end

  #Models
  def create_models
    dir_path = File.join(File.dirname(__FILE__), 'templates/models')
    Dir.new(dir_path).each do |file|
      if !File.directory?(file)
        template "#{dir_path}/#{File.basename(file)}", "app/models/#{File.basename(file)}"
      end
    end
  end
end
