require 'spec_helper'

describe "Migration rake" do
  include CoreHelper 

  it "should create all necessary migrations" do
    Dir.chdir("spec/staging")
    system("rails new gem_test -d mysql -m ../../lib/rails_templates/default_template.rb")
    success = Dir.new("gem_test/db/migrate/").all? do |file|
      File.basename(file).match("odin_migration")
    end
    success.should_not be_nil
  end

  it "should automatically apply the necessary migrations"
end
