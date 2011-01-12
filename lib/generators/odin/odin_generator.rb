require 'rails/generators'
require 'rails/generators/migration'

class OdinGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end
  
  def create_migration_file
    migration_template File.join(File.dirname(__FILE__), 'templates/migration.rb'), 'db/migrate/odin_migration'
  end
end
