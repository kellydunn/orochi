require "spec_helper"

module CoreHelper
  def create_rails_app
    Dir.chdir("spec/staging")
    system("rails new gem_test -d mysql -m ../../lib/rails_templates/default_template.rb >> /dev/null")
    puts "== Created rails application ====="
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
end

