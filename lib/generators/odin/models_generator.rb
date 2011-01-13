require "rails/generators"

class ModelsGenerator < Rails::Generators::Base
  def create_models
    dir_path = File.join(File.dirname(__FILE__), 'templates/models')
    Dir.new(dir_path).each do |file|
      if !File.directory?(file)
        template file, 'app/models#{File.basename(file)}'
      end
    end
  end
end
