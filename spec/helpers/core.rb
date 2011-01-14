require "spec_helper"

module CoreHelper
  def create_rails_app
    Dir.chdir("spec/staging")
    system("rails new gem_test -d mysql -m ../../lib/rails_templates/default_template.rb")
  end
  
  def destroy_rails_app
  end
end

