require 'spec_helper'

describe "A model acting as routeable" do
  include CoreHelper

  context "setting endpoints" do
    it "should be able to set its stopping and starting endpoints" 
    it "should not be able to route if no endpoints are set"
    it "should be able to route after endpoints are set"
  end
  
  context "routing" do
    it "should have a route that correctly reflects the endpoints"
    it "should be able to grab a polyline after being routed"
  end

end
