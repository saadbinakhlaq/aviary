require "rails_helper"

RSpec.describe BirdsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/birds").to route_to("birds#index")
    end

    it "routes to #show" do
      expect(:get => "/birds/1").to route_to("birds#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/birds").to route_to("birds#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/birds/1").to route_to("birds#destroy", :id => "1")
    end
  end
end
