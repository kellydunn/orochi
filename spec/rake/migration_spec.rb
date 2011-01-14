require 'spec_helper'

describe "Migration rake" do
  it "should create all necessary migrations" do
    Dir.chdir("spec/staging")
    system("rails new gem_test -d mysql -m ../../lib/rails_templates/default_template.rb")
    system("rake odin:awaken")
    Dir.new("db/migrate/").empty?.should_not == true
  end

  it "should automatically apply the necessary migrations"
end
