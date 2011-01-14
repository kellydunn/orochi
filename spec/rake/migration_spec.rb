require 'spec_helper'

describe "Migration rake" do
  include CoreHelper 

  before :each do
    create_rails_app
  end

  after :each do
    delete_rails_app
  end

  it "should create all necessary migrations" do
    success = Dir.new("gem_test/db/migrate/").all? do |file|
      File.basename(file).match("odin_migration")
    end
    success.should_not be_nil
  end

  it "should automatically apply the necessary migrations"
end
